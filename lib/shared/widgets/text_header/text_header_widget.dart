import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';

class TextHeaderWidget extends StatelessWidget {
  final String label;
  final Alignment alignment;
  final TextAlign textAlign;

  TextHeaderWidget(
      {Key? key,
      required this.label,
      this.alignment = Alignment.centerLeft,
      this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 30),
        alignment: alignment,
        child: Text(label,
            textAlign: textAlign,
            style: TextStyle(
                color: AppColors.textPrimary,
                fontFamily: AppFonts.semiBold,
                fontSize: 24)));
  }
}
