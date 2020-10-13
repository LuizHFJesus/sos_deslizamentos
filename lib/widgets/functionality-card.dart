import 'package:flutter/material.dart';

class FunctionalityCard extends StatelessWidget {

  final Icon icon;
  final String title;
  final String description;

  FunctionalityCard({
    @required this.icon,
    @required this.title,
    @required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 8.0),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            icon,
            SizedBox(width: 12.0,),
            Column(
              children: <Widget>[
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ],
            )
          ],
        )
    );
  }
}
