import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sos_deslizamentos_app/models/user_model.dart';
import 'package:sos_deslizamentos_app/screens/homeLogin_screen.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        model: UserModel(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SOS Deslizamentos',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.lightBlue[500],
          ),
          home: HomeLoginScreen(),
        )
    );
  }
}