import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sos_deslizamentos/core/core.dart';

class UnfilledCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nível de risco",
            style: TextStyle(
              color: AppColors.primaryDark,
              fontFamily: AppFonts.medium,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 25),
          Row(children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  "Preencha o formulário de risco!",
                  style: TextStyle(
                    color: AppColors.white,
                    fontFamily: AppFonts.medium,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.bottomRight,
                    child: SvgPicture.asset(AppImages.arrowRight)
                )
            )
          ],)
        ],
      ),
    );
  }
}
