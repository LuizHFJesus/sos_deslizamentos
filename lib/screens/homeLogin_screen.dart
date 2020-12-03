import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sos_deslizamentos_app/models/user_model.dart';
import 'package:sos_deslizamentos_app/screens/login_screen.dart';
import 'package:sos_deslizamentos_app/screens/signup_screen.dart';
import 'package:sos_deslizamentos_app/screens/success_screen.dart';
import 'package:sos_deslizamentos_app/widgets/icon_round_button.dart';
import '../widgets/round_button.dart';
import 'fail_screen.dart';

class HomeLoginScreen extends StatefulWidget {
  @override
  _HomeLoginScreenState createState() => _HomeLoginScreenState();
}

class _HomeLoginScreenState extends State<HomeLoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildBody() => Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.lightBlue[500],
              Colors.lightBlue[200],
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        )
    ),
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        key: _scaffoldKey,
        body: ScopedModelDescendant<UserModel>(
            builder: (context, child, model){
              if (model.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Stack(
                children: <Widget>[
                  _buildBody(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Image.asset(
                          "assets/images/logo.png",
                          height: 150.0,
                          width: 150.0,
                        ),

                        SizedBox(height: 16.0),

                        Text(
                          "SOS Deslizamentos",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w300
                          ),
                        ),

                        SizedBox(height: 40.0),

                        Row(
                          children: <Widget>[
                            Expanded(
                              child: OutlineButton(
                                onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SignUpScreen())
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                borderSide: BorderSide(color: Colors.white),
                                color: Colors.transparent,
                                highlightedBorderColor: Colors.white,
                                child: Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Center(
                                      child: Text(
                                        "CRIAR CONTA",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                ),
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: 20.0),

                        RoundButton(
                            buttonText: "Login",
                            backgroundColor: Colors.white,
                            textColor: Theme.of(context).primaryColor,
                            functionOnPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginScreen())
                              );
                            }
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 0.25, color: Colors.white)
                                  ),
                                ),
                              ),
                              Text(
                                "Ou conecte-se com".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 0.25, color: Colors.white)
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
                                        onSuccess: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => SuccessScreen(text: "Login efetuado com sucesso!",)
                                              )
                                          );
                                        },
                                        onFail: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => FailScreen(text: "Erro ao criar a conta!",)
                                              )
                                          );
                                        }
                                    );
                                  }
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }
        )
    );
  }
}