import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sos_deslizamentos/core/core.dart';

class HomeActivityItemWidget extends StatelessWidget {

  final String activityIcon;
  final Color bgColor;
  final String title;
  final String description;
  final VoidCallback onTap;

  HomeActivityItemWidget({
    Key? key,
    required this.activityIcon,
    required this.bgColor,
    required this.title,
    required this.description,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12.5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 0,
                child: Container(
                  alignment: Alignment.center,
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle
                  ),
                  child: Image.asset(activityIcon),
                )
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontFamily: AppFonts.medium,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        description,
                        style: TextStyle(
                          color: AppColors.textThird,
                          fontFamily: AppFonts.regular,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                )
              ),
              Expanded(
                flex: 0,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(AppImages.angleRight)
                )
              ),
            ],
          ),
        )
    );
  }
}
