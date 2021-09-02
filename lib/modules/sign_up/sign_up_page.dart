import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/shared/shared_widgets.dart';

class SignUpPage extends StatelessWidget {
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
          TextHeaderWidget(label: "Cadastre a sua\nConta"),
          TextFieldWidget(
            labelText: "Nome",
            keyboardType: TextInputType.name,
            validator: (value) => (value?.isEmpty ?? true ? "" : null),
            onChanged: (value) {},
          ),
          SizedBox(height: 20),
          TextFieldWidget(
            labelText: "E-mail",
            keyboardType: TextInputType.emailAddress,
            validator: (value) => (value?.isEmpty ?? true ? "" : null),
            onChanged: (value) {},
          ),
          SizedBox(height: 20),
          PasswordFieldWidget(text: "Senha"),
          SizedBox(height: 20),
          PasswordFieldWidget(text: "Confirme sua senha"),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: FilledButtonWidget(
              title: "Criar Conta",
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => AddressRegisterPage()));
              },
            ),
          ),
          RichButtonWidget(
            firstText: "Já tem uma conta? ",
            secondText: "Conecte-se",
            onTap: () {
              Navigator.pop(context);
            },
          )
        ]));
  }
}
