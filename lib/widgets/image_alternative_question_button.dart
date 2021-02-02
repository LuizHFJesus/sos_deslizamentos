import "package:flutter/material.dart";

class ImageAlternativeQuestionButton extends StatelessWidget {

  final String imageTitle;

  final String imageDirectory;

  final Function functionOnPressed;

  ImageAlternativeQuestionButton({
    @required this.imageTitle,
    @required this.imageDirectory,
    @required this.functionOnPressed
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: FlatButton(
          onPressed: functionOnPressed,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  imageTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 8.0),
                Image.asset(
                  imageDirectory,
                  height: 90.0,
                ),
              ],
            ),
          )
      ),
    );
  }
}