import 'package:flutter/material.dart';

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
      curve: Curves.bounceOut,
    );
  }

  goToLoginTab(){
    _pageController.animateToPage(
      2,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  goToHomeLoginTab(){
    _pageController.animateToPage(
      1,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _buildBody(),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 100.0),
                  child: Center(
                    child:  Image.asset(
                      "assets/images/logo.png",
                      height: 150.0,
                      width: 150.0,
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
                  margin: EdgeInsets.only(top: 100.0),
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
                Container(  //Button Login
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 20.0),
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.white,
                          onPressed: () => goToLoginTab(),
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
            ),
          ),
        ),
      ],
    );
  }
}
