import 'package:flutter/material.dart';

class IconRoundButton extends StatelessWidget {

  final String buttonText;

  final Color backgroundColor;
  final Color buttonTextColor;
  final Color iconColor;

  final Icon icon;

  final Function functionOnPressed;

  IconRoundButton({
    @required this.buttonText,
    @required this.backgroundColor,
    @required this.buttonTextColor,
    @required this.iconColor,
    @required this.icon,
    @required this.functionOnPressed
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
          onPressed: functionOnPressed,
          padding: EdgeInsets.all(20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: backgroundColor,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              // FaIcon(
              //   icon,
              //   color: Colors.white,
              //   size: 15.0,
              // ),
              Text(
                buttonText.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: buttonTextColor,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
