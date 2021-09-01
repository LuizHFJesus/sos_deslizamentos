import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/modules/change_password/change_password_page.dart';
import 'package:sos_deslizamentos/shared/shared_widgets.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBackground,
        appBar: AppBarWidget(
          typeLeftButton: "back",
          onTappedLeftButton: () {
            Navigator.pop(context);
          },
          onTappedRightButton: () {},
        ),
        body: DefaultPageWidget(children: [
          TextHeaderWidget(label: "Conecte a sua\nConta"),
          TextFieldWidget(
            labelText: "E-mail",
            keyboardType: TextInputType.emailAddress,
            validator: (value) => (value?.isEmpty ?? true ? "" : null),
            onChanged: (value) {},
          ),
          SizedBox(height: 20),
          PasswordFieldWidget(text: "Senha"),
          SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ChangePasswordPage(forgetPassword: true)));
            },
            child: Text("Esqueceu sua senha?",
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontFamily: AppFonts.semiBold,
                  fontSize: 14,
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: FilledButtonWidget(
              title: "Entrar",
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                // Navigator.pushReplacement(context, MaterialPageRoute(
                //     builder: (context) => HomePage())); TODO: Home route
              },
            ),
          ),
          RichButtonWidget(
              onTap: () {
                Navigator.pop(context);
              },
              firstText: "Ainda não tem uma conta? ",
              secondText: "Registre-se")
        ]));
  }
}
