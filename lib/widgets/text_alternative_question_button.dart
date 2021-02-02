import 'package:flutter/material.dart';

class TextAlternativeQuestionButton extends StatelessWidget {

  String buttonText;
  Function functionOnPressed;

  TextAlternativeQuestionButton({
    @required this.buttonText,
    @required this.functionOnPressed
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            onPressed: functionOnPressed,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
            ),
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                buttonText,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}