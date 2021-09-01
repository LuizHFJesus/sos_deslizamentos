import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';

class TextAnswerWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  TextAnswerWidget({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  Color get _bgColor => isSelected ? AppColors.primaryLight : AppColors.white;

  Color get _borderColor =>
      isSelected ? AppColors.primary : AppColors.greyLight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.deferToChild,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: _bgColor,
          border: Border.all(color: _borderColor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontFamily: AppFonts.regular,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
