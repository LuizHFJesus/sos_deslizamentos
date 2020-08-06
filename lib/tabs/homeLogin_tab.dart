import 'package:flutter/material.dart';
import 'package:sos_deslizamentos_app/screens/login-screen.dart';
import 'package:sos_deslizamentos_app/screens/signup-screen.dart';

class HomeLoginTab extends StatelessWidget {

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

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _buildBody(),
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 100.0),
              child: Center(
                child:  Image.asset(
                  "assets/images/logo.png",
                  height: 180.0,
                  width: 180.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                "SOS Deslizamentos",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w300
                ),
              ),
            ),
            Container(  // SignUp Button
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 70.0),
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: OutlineButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      borderSide: BorderSide(color: Colors.white),
                      color: Colors.transparent,
                      highlightedBorderColor: Colors.white,
                      onPressed: (){
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context)=>SignUpScreen())
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "CRIAR CONTA",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.3
                                ),
                              ),
                            )
                          ],
                        )
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(  //Button Login
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.white,
                      onPressed: (){
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context)=>LoginScreen())
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "LOGIN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.lightBlue[300],
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.3
                                ),
                              ),
                            )
                          ],
                        )
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
