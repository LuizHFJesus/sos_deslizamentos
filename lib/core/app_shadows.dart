import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';

class AppShadows {
  static final shadowSmall =
     BoxShadow(color: AppColors.shadow, blurRadius: 20, offset: Offset(0, 4));

  static final shadowMedium =
      BoxShadow(color: AppColors.shadow, blurRadius: 10, offset: Offset(0, 4));

  static final shadowBig =
      BoxShadow(color: AppColors.shadow, blurRadius: 5, offset: Offset(0, 4));
}