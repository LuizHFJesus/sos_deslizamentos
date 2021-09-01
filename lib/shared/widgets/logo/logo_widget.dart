import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(AppImages.logo),
        SizedBox(height: 25),
        Text(
          "SOS Deslizamentos",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 25,
            fontFamily: AppFonts.regular,
          ),
        ),
      ],
    );
  }
}
