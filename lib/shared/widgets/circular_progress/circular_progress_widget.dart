import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';

class CircularProgressWidget extends StatelessWidget {
  final Color? color;

  const CircularProgressWidget({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.primary),
    ));
  }
}
