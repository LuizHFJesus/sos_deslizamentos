import 'package:flutter/material.dart';
import 'package:sos_deslizamentos_app/widgets/round_button.dart';

class HomeLoginTab extends StatelessWidget {

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

  final PageController _pageController;
  HomeLoginTab(this._pageController);

  goToSignUpTab(){
    _pageController.animateToPage(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.ease,
    );
  }

  goToLoginTab(){
    _pageController.animateToPage(
      2,
      duration: Duration(milliseconds: 800),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildBody(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/logo.png",
                  height: 150.0,
                  width: 150.0,
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
                  margin: EdgeInsets.only(top: 100.0),
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
                          onPressed: () => goToSignUpTab(),
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

                Container( // button login
                  margin: EdgeInsets.only(top: 20.0),
                  child: RoundButton(
                    buttonText: "Login",
                    backgroundColor: Colors.white,
                    textColor: Theme.of(context).primaryColor,
                    functionOnPressed: ()=>goToLoginTab()
                  )
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
