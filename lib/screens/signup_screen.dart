import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sos_deslizamentos_app/models/user_model.dart';
import 'package:sos_deslizamentos_app/screens/fail_screen.dart';
import 'package:sos_deslizamentos_app/screens/formaddress_screen.dart';
import 'package:sos_deslizamentos_app/screens/success_screen.dart';
import 'package:sos_deslizamentos_app/widgets/custom_textFormField.dart';
import 'package:sos_deslizamentos_app/widgets/icon_round_button.dart';
import 'package:sos_deslizamentos_app/widgets/round_button.dart';
import 'package:sos_deslizamentos_app/widgets/title_formField.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreen createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isObscure = true;
  void _toggleVisibility(){
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("Criar Conta", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),

      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );

          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          TitleFormField(title: "Nome Completo"),
                          CustomTextFormField(
                            inputFormatter: null,
                            controller: _nameController,
                            obscureText: false,
                            hintText: "José Antônio da Silva",
                            prefixIcon: Icon(Icons.person),
                            suffixIcon: null,
                            inputType: TextInputType.text,
                            validator: RequiredValidator(errorText: "O nome é obrigatório!")
                          ),
                        ],
                      ),
                      Divider(height: 16.0),

                      Column(
                        children: <Widget>[
                          TitleFormField(title: "E-mail"),
                          CustomTextFormField(
                            inputFormatter: null,
                            controller: _emailController,
                            obscureText: false,
                            hintText: "seuemail@endereço",
                            prefixIcon: Icon(Icons.email),
                            suffixIcon: null,
                            inputType: TextInputType.emailAddress,
                            validator: emailValidator
                          ),
                        ],
                      ),
                      Divider(height: 16.0),

                      Column(
                        children: <Widget>[
                          TitleFormField(title: "Senha"),
                          CustomTextFormField(
                            inputFormatter: null,
                            controller: _passwordController,
                            obscureText: _isObscure,
                            hintText: "*********",
                            prefixIcon: Icon(Icons.vpn_key),
                            suffixIcon: IconButton(
                              onPressed: _toggleVisibility,
                              icon: _isObscure ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                            ),
                            inputType: TextInputType.text,
                            validator: passwordValidator
                          ),
                        ],
                      ),
                      Divider(height: 16.0,),

                      Container( // button login
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 10.0),
                        alignment: Alignment.center,
                        child: RoundButton(
                          buttonText: "Criar Conta",
                          backgroundColor: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          functionOnPressed: (){
                            if(_formKey.currentState.validate()){

                              Map<String, dynamic> userData = {
                                "email": _emailController.text,
                                "name": _nameController.text,
                              };

                              model.signUpWithEmail(
                                userData: userData,
                                password: _passwordController.text,
                                onSuccess: _onSuccess,
                                onFail: _onFail
                              );
                            }
                          }
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            ),
          );
        }
      )
    );
  }

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: "O e-mail é obrigatório!"),
    EmailValidator(errorText: "Entre com um e-mail válido!"),
  ]);

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'A senha é obrigatória!'),
    MinLengthValidator(8, errorText: 'A senha deve ter pelo menos 8 dígitos!'),
  ]);

  void _onSuccess(){
    _nameController.text = "";
    _emailController.text = "";
    _passwordController.text = "";

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SuccessScreen(text: "Conta criada com sucesso!")
      )
    );
  }

  void _onFail(){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FailScreen(text: "Erro ao criar a conta!",)
        )
    );
  }

}
