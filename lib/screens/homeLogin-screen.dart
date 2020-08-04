import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sos_deslizamentos_app/screens/login-screen.dart';
import 'package:sos_deslizamentos_app/screens/signup-screen.dart';

class LoginHomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    Widget _buildBody() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.lightBlue[400],
                Colors.lightBlue[200],
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
    );

    return PageView(
      children: <Widget>[
        Scaffold(
          body: SignUpScreen(),
        ),
        Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _buildBody(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    Image.asset(
                      "assets/images/logo.png",
                      height: 180.0,
                      width: 180.0,
                    ),
                    Text(
                      "SOS Deslizamentos",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                    SizedBox(height: 80.0,),
                    Container(
                      height: 60.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(70.0)),
                        border: Border.all(
                          color: Colors.white,
                          width: 3.0
                        ),
                      ),
                      child: Text(
                        "CRIAR CONTA",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          letterSpacing: 0.3
                        ),
                      ),
                    ),
                    SizedBox(height: 22.0,),
                    Container(
                      height: 60.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(70.0))
                      ),
                      child: Text(
                        "ENTRAR",
                        style: TextStyle(
                          color: Colors.lightBlue[300],
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          letterSpacing: 0.3
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Scaffold(
          body: LoginScreen(),
        )
      ],
    );
  }
}
