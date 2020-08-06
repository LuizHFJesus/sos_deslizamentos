import 'package:flutter/material.dart';
import 'package:sos_deslizamentos_app/screens/homeLogin_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SOS Deslizamentos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.lightBlue[400],
      ),
      home: HomeLoginScreen(),
    );
  }
}

