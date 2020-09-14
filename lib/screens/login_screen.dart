import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sos_deslizamentos_app/models/user_model.dart';
import 'package:sos_deslizamentos_app/screens/fail_screen.dart';
import 'package:sos_deslizamentos_app/screens/recoverPassword_screen.dart';
import 'package:sos_deslizamentos_app/screens/success_screen.dart';
import 'package:sos_deslizamentos_app/widgets/custom_textFormField.dart';
import 'package:sos_deslizamentos_app/widgets/icon_round_button.dart';
import 'package:sos_deslizamentos_app/widgets/round_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _rememberMe = false;

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
        title: Text("Realizar Login", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),

      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          if(model.isLoading)
            return Center(child: CircularProgressIndicator(),);

          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[

                      CustomTextFormField(
                        title: "E-mail",
                        controller: _emailController,
                        obscureText: false,
                        hintText: "seuemail@endereço",
                          prefixIcon: Icon(Icons.email),
                        suffixIcon: null,
                        inputType: TextInputType.emailAddress,
                        validator: RequiredValidator(errorText: "O e-mail é obrigatório!")
                      ),
                      Divider(height: 16.0),

                      CustomTextFormField(
                        title: "Senha",
                        controller: _passwordController,
                        obscureText: _isObscure,
                        hintText: "********",
                        prefixIcon: Icon(Icons.vpn_key),
                        suffixIcon: IconButton(
                          onPressed: _toggleVisibility,
                          icon: _isObscure ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                        ),
                        inputType: null,
                        validator: RequiredValidator(errorText: "A senha é obrigatória!")
                      ),
                      Divider(height: 16.0),

                      Row( // Forgot password button
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            padding: EdgeInsets.zero,
                            child: Text(
                              "Esqueceu sua senha?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                                fontSize: 16.0,
                              ),
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RecoverPasswordScreen())
                              );
                            },
                          ),
                        ],
                      ),

                      Row(
                        children: <Widget>[

                          Checkbox(
                            value: _rememberMe,
                            //activeColor: Theme.of(context).primaryColor,
                            onChanged:(bool value) {
                              setState(() {
                                _rememberMe = value;
                              });
                            }
                          ),

                          Text(
                            "Lembrar meu cadastro",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),

                      Container( // button login
                        margin: EdgeInsets.only(top: 8.0),
                        child: RoundButton(
                          buttonText: "Entrar",
                          backgroundColor: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          functionOnPressed: (){
                            if(_formKey.currentState.validate()){
                              model.signInWithEmail(
                                email: _emailController.text,
                                password: _passwordController.text,
                                onSuccess: _onSuccess,
                                onFail: _onFail
                              );
                            }
                          }
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0.25)
                                ),
                              ),
                            ),
                            Text(
                              "Ou conecte com".toUpperCase(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0.25)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container( // login with facebook/google buttons
                        margin: EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: <Widget>[
                            IconRoundButton( // Facebook button
                              buttonText: "Facebook",
                              backgroundColor: Color.fromARGB(255, 59, 89, 152),
                              buttonTextColor: Colors.white,
                              iconColor: Colors.white,
                              icon: null,
                              functionOnPressed: ()=>null
                            ),
                            SizedBox(width: 8.0),
                            IconRoundButton( // Google button
                              buttonText: "Google",
                              backgroundColor: Color.fromARGB(255, 219, 74, 57),
                              buttonTextColor: Colors.white,
                              iconColor: Colors.white,
                              icon: null,
                              functionOnPressed: (){
                                model.signInWithGoogle(
                                  onSuccess: _onSuccess,
                                  onFail: _onFail
                                );
                              }
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                )
              ),
            ),
          );
        },
      ),
    );
  }

  void _onSuccess(){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SuccessScreen(text: "Login efetuado com sucesso!",)
        )
    );
  }

  void _onFail(){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FailScreen(text: "Erro ao realizar o login!",)
        )
    );
  }

}