import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final String? initialValue;
  final TextInputType keyboardType;
  final int? maxLines;
  final bool enabled;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChanged;

  TextFieldWidget({
    Key? key,
    required this.labelText,
    this.initialValue,
    required this.keyboardType,
    this.maxLines,
    this.enabled = true,
    this.validator,
    this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        initialValue: initialValue,
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 16.0,
          fontFamily: AppFonts.regular,
        ),
        obscureText: false,
        keyboardType: keyboardType,
        minLines: 1,
        maxLines: maxLines,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          enabled: enabled,
          contentPadding: EdgeInsets.all(20),
          labelText: labelText,
          labelStyle: TextStyle(color: AppColors.textThird),
          filled: true,
          fillColor: AppColors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.greyLight),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.greyLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.primary),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.primary),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}