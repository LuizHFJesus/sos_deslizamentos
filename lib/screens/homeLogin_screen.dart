import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sos_deslizamentos_app/tabs/homeLogin_tab.dart';
import 'package:sos_deslizamentos_app/tabs/login_tab.dart';
import 'package:sos_deslizamentos_app/tabs/signup_tab.dart';

class HomeLoginScreen extends StatelessWidget {

  final _pageController = PageController(initialPage: 1, viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        SignUpTab(),
        HomeLoginTab(_pageController),
        LoginTab()
      ],
    );
  }
}
