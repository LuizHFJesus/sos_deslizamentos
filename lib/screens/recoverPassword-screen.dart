import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sos_deslizamentos_app/models/user_model.dart';
import 'package:sos_deslizamentos_app/screens/success-screen.dart';
import 'package:sos_deslizamentos_app/widgets/custom_textFormField.dart';
import 'package:sos_deslizamentos_app/widgets/round_button.dart';

class RecoverPasswordScreen extends StatefulWidget {
  @override
  _RecoverPasswordScreenState createState() => _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {

  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("Recuperar Senha"),
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          if(model.isLoading)
            return Center(child: CircularProgressIndicator(),);

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 16.0),
                      Text(
                        "Esqueceu a sua Senha?",
                        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Preencha abaixo o seu e-mail para redefinir a senha.",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 40.0),
                      CustomTextFormField(
                        title: "E-mail",
                        controller: _emailController,
                        obscureText: false,
                        hintText: "seuemail@endereço",
                        suffixIcon: null,
                        inputType: TextInputType.emailAddress,
                        validator: RequiredValidator(errorText: "O e-mail é obrigatório!")
                      ),
                      SizedBox(height: 40.0),
                      RoundButton(
                        buttonText: "Continuar",
                        backgroundColor: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        functionOnPressed: (){
                          if(_formKey.currentState.validate()){
                            model.recoverPassword(_emailController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SuccessScreen(text: "Confira o seu e-mail para redefinir a senha!",)
                              )
                            );
                            _emailController.text = "";
                          }
                        }
                      ),
                    ],
                  ),
                )
              )
            ),
          );
        }
      ),
    );
  }
}
