import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sos_deslizamentos/core/core.dart';

class PasswordFieldWidget extends StatefulWidget {
  final String text;

  PasswordFieldWidget({Key? key, required this.text}) : super(key: key);

  @override
  _PasswordFieldWidgetState createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  
  bool isObscure = true;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontFamily: AppFonts.regular),
        obscureText: isObscure,
        validator: (String? value){},
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () => setState(() { isObscure = !isObscure; }),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SvgPicture.asset(
                isObscure ? AppImages.passwordShow : AppImages.passwordHide,
              ),
            ),
          ),
          contentPadding: EdgeInsets.all(20),
          labelText: widget.text,
          labelStyle: TextStyle(color: AppColors.textThird),
          filled: true,
          fillColor: AppColors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.greyLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
