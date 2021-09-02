import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sos_deslizamentos/core/app_states.dart';
import 'package:sos_deslizamentos/shared/auth/auth_controller.dart';
import 'package:sos_deslizamentos/shared/models/address_model.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';

class AddressRegisterController {
  final appStateNotifier = ValueNotifier<AppState>(AppState.empty);
  set appState(AppState appState) => appStateNotifier.value = appState;
  AppState get appState => appStateNotifier.value;

  AuthController authController = AuthController();

  final formKey = GlobalKey<FormState>();
  AddressModel address = AddressModel();

  String? validateState(String? value) =>
      value?.isEmpty ?? true ? "O campo 'Estado' precisa ser preenchido" : null;

  String? validateCity(String? value) =>
      value?.isEmpty ?? true ? "O campo 'Cidade' precisa ser preenchido" : null;

  String? validateBairro(String? value) =>
      value?.isEmpty ?? true ? "O campo 'Bairro' precisa ser preenchido" : null;

  void onChange({String? state, String? city, String? bairro, String? uid}) {
    address = address.copyWith(
      state: state,
      city: city,
      bairro: bairro,
      uid: uid,
    );
  }

  Future<void> saveAddress(UserModel user) async {

    if (user.addressId != null) {
      await FirebaseFirestore.instance
          .collection('addresses')
          .doc(user.addressId)
          .set(address.toMap());
    } else {
      await FirebaseFirestore.instance
          .collection('addresses')
          .add(address.toMap())
          .then((value) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({"addressId": value.id});
      });
    }

    return;
  }

  Future<void> registerAddress(BuildContext context, UserModel user) async {
    appState = AppState.loading;

    final form = formKey.currentState;
    if (form!.validate()) {
      onChange(uid: user.uid);
      await saveAddress(user);
      final UserModel _newUser =
          await authController.updateCurrentUser(user.uid);
      if (user.addressId == null && user.riskFormId == null) {
        Navigator.pushReplacementNamed(context, "/risk_form",
            arguments: _newUser);
      } else if (user.addressId == null) {
        Navigator.pushReplacementNamed(context, "/home", arguments: _newUser);
      } else if (user.addressId != null) {
        Navigator.pushReplacementNamed(context, "/result", arguments: true);
      }

      // appState = AppState.success;
      return;
    }
  }
}
