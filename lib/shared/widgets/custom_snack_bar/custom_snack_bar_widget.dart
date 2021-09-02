import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';

class CustomSnackBarWidget extends StatelessWidget {
  final String text;

  CustomSnackBarWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      backgroundColor: AppColors.red,
      content: Text(
        text, // title
        style: TextStyle(
          color: AppColors.appBackground,
          fontFamily: AppFonts.regular,
          fontSize: 12,
        ),
      ),
    );
  }
}
