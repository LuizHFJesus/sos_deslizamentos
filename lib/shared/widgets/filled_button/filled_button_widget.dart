import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';

class FilledButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  FilledButtonWidget({Key? key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(35),
          boxShadow: [AppShadows.shadowSmall]
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontFamily: AppFonts.semiBold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
