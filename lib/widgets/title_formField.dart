import "package:flutter/material.dart";

class TitleFormField extends StatelessWidget {

  final String title;

  TitleFormField({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
            fontSize: 16.0
        ),
      ),
    );
  }
}
