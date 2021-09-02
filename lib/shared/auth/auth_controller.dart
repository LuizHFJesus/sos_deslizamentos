import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos_deslizamentos/modules/risk_form/risk_form_controller.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;

  Future<void> setUser(BuildContext context, UserModel? user) async {
    if (user != null) {
      final QuerySnapshot result = await Future.value(FirebaseFirestore.instance
          .collection("users")
          .where("uid", isEqualTo: "${user.uid}")
          .limit(1)
          .get());
      final List<DocumentSnapshot> docs = result.docs;
      if (docs.length == 1) {
        final response = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        final dbUser = UserModel.fromFireStore(response);
        user = dbUser;
      } else {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set(user.toMap());
      }
      saveUser(user);
      _user = user;

      await RiskFormController().getUserFormScore(_user!);

      if (_user!.addressId != null && _user!.riskFormId != null) {
        Navigator.pushReplacementNamed(context, "/home", arguments: _user!);
      } else if (_user!.addressId == null) {
        Navigator.pushReplacementNamed(context, "/address_register",
            arguments: _user!);
      } else if (_user!.riskFormId == null) {
        Navigator.pushReplacementNamed(context, "/risk_form",
            arguments: _user!);
      }
    } else {
      Navigator.pushReplacementNamed(context, "/connect_account");
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    if (instance.containsKey("user")) {
      final user = instance.get("user") as String;
      setUser(context, UserModel.fromJson(user));
    } else {
      setUser(context, null);
    }
    return;
  }

  Future<void> deleteCurrentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await instance.clear();
    Navigator.pushNamedAndRemoveUntil(context, "/splash", (route) => false);
  }

  Future<UserModel> updateCurrentUser(String uid) async {
    final response =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final updatedUser = UserModel.fromFireStore(response);
    await saveUser(updatedUser);
    return updatedUser;
  }
}
