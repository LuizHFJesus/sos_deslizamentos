import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/shared/auth/auth_controller.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';
import 'package:sos_deslizamentos/shared/shared_widgets.dart';

class ConnectAccountController {
  final stateNotifier = ValueNotifier<AppState>(AppState.empty);
  set state(AppState state) => stateNotifier.value = state;
  AppState get state => stateNotifier.value;

  final authController = AuthController();

  Future<void> googleSignIn(BuildContext context) async {
    state = AppState.loading;

    final account = await GoogleSignIn(scopes: ['email']).signIn();

    if (account != null) {
      final GoogleSignInAuthentication accountAuth =
          await account.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: accountAuth.accessToken, idToken: accountAuth.idToken);

      try {
        await FirebaseAuth.instance.signInWithCredential(credential);
        final user = UserModel(
          uid: account.id,
          name: account.displayName!,
          email: account.email,
          photoUrl: account.photoUrl!,
        );
        await authController.setUser(context, user);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 3),
              content: CustomSnackBarWidget(
                text: "A conta ja existe com uma credencial diferente.",
              ),
            ),
          );
          authController.setUser(context, null);
          state = AppState.success;
          print(e);
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 3),
              content: CustomSnackBarWidget(
                text: "Aconteceu um erro durante a tentativa de login. Por favor, tente novamente.",
              ),
            ),
          );
          authController.setUser(context, null);
          state = AppState.success;
          print(e);
        } else if (e.code == '') {}
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 3),
            content: CustomSnackBarWidget(
              text: "Aconteceu um erro durante a tentativa de login. Por favor, tente novamente.",
            ),
          ),
        );
        authController.setUser(context, null);
        state = AppState.success;
        print(e);
      }
    } else {
      state = AppState.success;
    }
  }

  Future<void> googleSignOut(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try{
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      await authController.deleteCurrentUser(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          content: CustomSnackBarWidget(
            text: "Aconteceu um erro durante a tentativa de sair. Por favor, tente novamente.",
          ),
        ),
      );
    }
  }

}
