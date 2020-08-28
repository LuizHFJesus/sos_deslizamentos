import 'package:flutter/material.dart';
import 'package:sos_deslizamentos_app/widgets/round_button.dart';

class FailScreen extends StatelessWidget {

  final String text;
  FailScreen({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Icon(
                  Icons.mood_bad,
                  color: Colors.redAccent,
                  size: 150.0,
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 50.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

              SizedBox(height: 16.0),

              Container( // button login
                margin: EdgeInsets.only(top: 50.0),
                child: RoundButton(
                  buttonText: "Continuar",
                  backgroundColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  functionOnPressed: (){
                    Navigator.pop(context);
                  }
                )
              ),
            ],
          ),
        ),
      )
    );
  }
}
