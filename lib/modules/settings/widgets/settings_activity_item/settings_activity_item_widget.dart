import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sos_deslizamentos/core/core.dart';

class SettingsActivityItemWidget extends StatelessWidget {

  final String activityIcon;
  final String title;
  final String description;
  final VoidCallback onTap;

  SettingsActivityItemWidget({
    Key? key,
    required this.activityIcon,
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
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  flex: 0,
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [AppShadows.shadowSmall],
                      shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset(activityIcon),
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
