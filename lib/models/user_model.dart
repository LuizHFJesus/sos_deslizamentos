import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class UserModel extends Model{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  FirebaseUser firebaseUser;
  String errorText = "";

  Map<String, dynamic> userData = Map();

  bool isLoading = false;
  void isLoadingTrue(){
    isLoading = true;
    notifyListeners();
  }
  void isLoadingFalse(){
    isLoading = false;
    notifyListeners();
  }

  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    _loadCurrentUser();
  }

  void signUpWithEmail({@required Map<String, dynamic> userData, @required String password,
    @required VoidCallback onSuccess, @required VoidCallback onFail}) async {

    isLoadingTrue();

    try{
      firebaseUser = (await _auth.createUserWithEmailAndPassword(
          email: userData['email'], password: password)).user;

      await _saveUserData(userData);

      onSuccess();
      isLoadingFalse();
    } catch (error) {


      print("Teste Erro: $error");
      onFail();
      isLoadingFalse();
    }
  }

  void signInWithEmail({@required String email, @required String password,
    @required VoidCallback onSuccess, @required VoidCallback onFail}) async {
      isLoadingTrue();

      try{
        firebaseUser = (await _auth.signInWithEmailAndPassword(
            email: email, password: password)).user;

        await _loadCurrentUser();

        onSuccess();
        isLoadingFalse();
      } catch (error){
        print("Teste Erro: $error");
        onFail();
        isLoadingFalse();
      }
  }

  void signInWithGoogle({@required VoidCallback onSuccess, @required VoidCallback onFail}) async {
    isLoadingTrue();

    try{
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken
      );

      final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;

      //if(googleAuth.accessToken != ){
        Map<String, dynamic> userData = {
          "email": user.email,
          "name": user.displayName,
          "photoUrl": user.photoUrl,
        };
        _saveUserData(userData);
     // }


      await _loadCurrentUser();

      onSuccess();
      isLoadingFalse();

    } catch (error){
      print("Teste Erro: $error");
      onFail();
      isLoadingFalse();
    }
  }

  void signOut() async {
    await _auth.signOut();

    userData = Map();
    firebaseUser = null;

    notifyListeners();
  }

  void recoverPassword(String email){
    _auth.sendPasswordResetEmail(email: email);
  }

  bool isLoggedIn(){
    return firebaseUser != null;
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async{
    this.userData = userData;
    await Firestore.instance.collection("users").document(firebaseUser.uid)
        .setData(userData);
  }

  Future<Null> _loadCurrentUser() async{
    if(firebaseUser == null)
      firebaseUser = await _auth.currentUser();
    if(firebaseUser != null){
      if(userData["name"] == null){
        DocumentSnapshot docUser =
          await Firestore.instance.collection("users").document(firebaseUser.uid).get();
        userData = docUser.data;
      }
    }
    notifyListeners();
  }
}