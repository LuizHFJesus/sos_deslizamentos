import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextFormField extends StatelessWidget {

  final TextInputFormatter inputFormatter;
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final Icon prefixIcon;
  final IconButton suffixIcon;
  final TextInputType inputType;
  final Function validator;

  CustomTextFormField({
    @required this.inputFormatter,
    @required this.controller,
    @required this.obscureText,
    @required this.hintText,
    @required this.prefixIcon,
    @required this.suffixIcon,
    @required this.inputType,
    @required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              //inputFormatters: [inputFormatter],
              controller: controller,
              obscureText: obscureText,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
              ),
              keyboardType: inputType,
              validator: validator,
            ),
          )
        ],
      ),
    );
  }
}
