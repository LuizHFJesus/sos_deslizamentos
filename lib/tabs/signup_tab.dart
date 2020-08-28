import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sos_deslizamentos_app/models/user_model.dart';
import 'package:sos_deslizamentos_app/screens/fail-screen.dart';
import 'package:sos_deslizamentos_app/screens/success-screen.dart';
import 'package:sos_deslizamentos_app/widgets/custom_textFormField.dart';
import 'package:sos_deslizamentos_app/widgets/icon_round_button.dart';
import 'package:sos_deslizamentos_app/widgets/round_button.dart';

class SignUpTab extends StatefulWidget {
  @override
  _SignUpTabState createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {

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

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.keyboard_arrow_right),
            color: Theme.of(context).primaryColor,
            iconSize: 30.0,
            onPressed: (){}
          ),
        ],
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
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[

//                      Padding(
//                        padding: EdgeInsets.symmetric(vertical: 40.0),
//                        child: Image.asset(
//                          "assets/images/logo.png",
//                          height: 120.0,
//                          width: 120.0,
//                        ),
//                      ),

                      CustomTextFormField(
                        title: "Nome Completo",
                        controller: _nameController,
                        obscureText: false,
                        hintText: "José Antônio da Silva",
                        suffixIcon: null,
                        inputType: TextInputType.text,
                        validator: RequiredValidator(errorText: "O nome é obrigatório!")
                      ),
                      Divider(height: 16.0),

                      CustomTextFormField(
                        title: "E-mail",
                        controller: _emailController,
                        obscureText: false,
                        hintText: "seuemail@endereço",
                        suffixIcon: null,
                        inputType: TextInputType.emailAddress,
                        validator: emailValidator
                      ),
                      Divider(height: 16.0),

                      CustomTextFormField(
                        title: "Senha",
                        controller: _passwordController,
                        obscureText: _isObscure,
                        hintText: "*********",
                        suffixIcon: IconButton(
                          onPressed: _toggleVisibility,
                          icon: _isObscure ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                        ),
                        inputType: TextInputType.text,
                        validator: passwordValidator
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

                              model.signUp(
                                userData: userData,
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
                              "Ou cadastre-se com".toUpperCase(),
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
                                functionOnPressed: ()=>null
                            ),
                          ],
                        ),
                      )
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
        builder: (context) => SuccessScreen(text: "Conta criada com sucesso!",)
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
