import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sos_deslizamentos/core/core.dart';

class AppBarWidget extends PreferredSize {

  final String typeLeftButton;
  final VoidCallback onTappedLeftButton;
  final String typeRightButton;
  final VoidCallback onTappedRightButton;
  final String userPhoto;

  // NextButtonWidget.green({required String label, required VoidCallback onTap})
  //       : this.backgroundColor = AppColors.darkGreen,
  //         this.fontColor = AppColors.white,
  //         this.borderColor = AppColors.green,
  //         this.label = label,
  //         this.onTap = onTap;

  AppBarWidget({
    this.typeLeftButton = "null",
    required this.onTappedLeftButton,
    this.typeRightButton = "null",
    required this.onTappedRightButton,
    this.userPhoto = ""
  }) : assert(["back", "null"].contains(typeLeftButton)),
        assert(["sign_out", "question_mark", "userPhoto", "null"]
            .contains(typeRightButton)),
        super(
    preferredSize: Size.fromHeight(70),
    child: SafeArea(
      child: Container(
        height: 70,
        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            typeLeftButton == "back" ?
            Container(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: onTappedLeftButton,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(14)
                  ),
                  child: Center(child: SvgPicture.asset(AppImages.arrowLeft)),
                ),
              ),
            ) : Container(),

            typeRightButton != "null" ?
            Container(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: onTappedRightButton,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(
                        typeRightButton == "userPhoto" ? 100 : 14)
                  ),
                  child: Center(
                    child: typeRightButton == "userPhoto" ?
                    ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.network(userPhoto))
                        : SvgPicture.asset("assets/images/$typeRightButton.svg"),
                  ),
                ),
              ),
            ) : Container(),
          ],
        ),
      ),
    )
  );
}