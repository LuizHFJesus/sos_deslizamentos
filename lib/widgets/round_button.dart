import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  final String buttonText;

  final Color backgroundColor;
  final Color textColor;

  final Function functionOnPressed;

  RoundButton({
    @required this.buttonText,
    @required this.backgroundColor,
    @required this.textColor,
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
              borderRadius: BorderRadius.circular(30.0)
            ),
            color: backgroundColor,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  buttonText.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
