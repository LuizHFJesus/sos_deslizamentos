import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';

class RichButtonWidget extends StatelessWidget {
  final String firstText;
  final String secondText;
  final VoidCallback onTap;

  RichButtonWidget({
    Key? key,
    required this.onTap,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Text.rich(TextSpan(children: [
          TextSpan(
            text: firstText,
            style: TextStyle(
                fontSize: 12,
                color: AppColors.textPrimary,
                fontFamily: AppFonts.regular),
          ),
          TextSpan(
              text: secondText,
              style: TextStyle(
                  fontSize: 12,
                  color: AppColors.primaryDark,
                  fontFamily: AppFonts.semiBold))
        ])));
  }
}
