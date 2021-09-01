import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';

class ImageAnswerWidget extends StatelessWidget {
  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  ImageAnswerWidget({
    Key? key,
    required this.image,
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
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: _bgColor,
            border: Border.all(color: _borderColor),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [AppShadows.shadowSmall]),
        child: Image.network(image),
      ),
    );
  }
}
