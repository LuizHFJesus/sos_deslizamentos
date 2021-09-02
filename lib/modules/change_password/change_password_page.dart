import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/shared/shared_widgets.dart';

class ChangePasswordPage extends StatelessWidget {
  final bool forgetPassword;

  ChangePasswordPage({Key? key, required this.forgetPassword})
      : super(key: key);

  String get word => forgetPassword ? "recuperação" : "alteração";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBackground,
        appBar: AppBarWidget(
            typeLeftButton: "back",
            onTappedLeftButton: () {
              Navigator.pop(context);
            },
            onTappedRightButton: () {}),
        body: DefaultPageWidget(children: [
          TextHeaderWidget(
            alignment: Alignment.center,
            label: forgetPassword
                ? "Esqueceu a sua senha?"
                : "Deseja alterar sua senha?",
            textAlign: TextAlign.center,
          ),
          Text(
            "Preencha o seu e-mail registrado para receber instruções de "
            "$word de senha.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textThird,
              fontFamily: AppFonts.regular,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 70),
          TextFieldWidget(
            labelText: "E-mail",
            keyboardType: TextInputType.emailAddress,
            validator: (value) => (value?.isEmpty ?? true ? "" : null),
            onChanged: (value) {},
          ),
          SizedBox(height: 40),
          FilledButtonWidget(onTap: () {}, title: "Enviar"),
          forgetPassword
              ? Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: RichButtonWidget(
                      firstText: "Lembrou a sua senha? ",
                      secondText: "Entre na sua conta",
                      onTap: () {
                        Navigator.pop(context);
                      }),
                )
              : Container()
        ]));
  }
}
