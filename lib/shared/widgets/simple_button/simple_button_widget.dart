import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sos_deslizamentos/core/core.dart';

class SimpleButtonWidget extends StatelessWidget {
  final VoidCallback onTapped;
  final String title;
  final String icon;

  SimpleButtonWidget({
    Key? key,
    required this.onTapped,
    required this.title,
    this.icon = ""
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 60,
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.greyLight),
            borderRadius: BorderRadius.circular(15),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontFamily: AppFonts.regular,
                fontSize: 16,
              ),
            ),
            icon != "" ?
            Container(
              child: SvgPicture.asset(AppImages.angleRight),
            ) : Container(),
          ],
        ),
      ),
    );
  }
}