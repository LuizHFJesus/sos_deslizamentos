import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sos_deslizamentos/core/core.dart';

class OutlinedButtonWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  OutlinedButtonWidget({
    Key? key,
    required this.title,
    this.icon = "",
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.primary),
            borderRadius: BorderRadius.circular(35),
            boxShadow: [AppShadows.shadowSmall]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != "" ? 
              Container(
                padding: EdgeInsets.only(right: 15),
                child: SvgPicture.asset(icon),
              ) : Container(),
            Text(
              title,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontFamily: AppFonts.semiBold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}