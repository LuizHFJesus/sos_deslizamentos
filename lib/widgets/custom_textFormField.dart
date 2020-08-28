import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final IconButton suffixIcon;
  final TextInputType inputType;
  final Function validator;


  CustomTextFormField({
    @required this.title,
    @required this.controller,
    @required this.obscureText,
    @required this.hintText,
    @required this.suffixIcon,
    @required this.inputType,
    @required this.validator
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.start,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 15.0
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: controller,
                  obscureText: obscureText,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: suffixIcon,
                  ),
                  keyboardType: inputType,
                  validator: validator,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
