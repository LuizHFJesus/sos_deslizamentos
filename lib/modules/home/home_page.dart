import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/modules/home/widgets/home_activity_item/home_activity_item_widget.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';
import 'package:sos_deslizamentos/shared/shared_widgets.dart';

class HomePage extends StatelessWidget {
  final UserModel user;

  HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBarWidget(
        onTappedLeftButton: () {},
        typeRightButton: "userPhoto",
        onTappedRightButton: () {
          Navigator.pushNamed(context, "/settings", arguments: user);
        },
        userPhoto: user.photoUrl,
      ),
      body: DefaultPageWidget(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Bem-vindo,\n",
                    style: TextStyle(
                      color: AppColors.textThird,
                      fontFamily: AppFonts.regular,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: user.name,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontFamily: AppFonts.semiBold,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: RiskLevelCardWidget(user: user),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.5),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.greyLight),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [AppShadows.shadowBig],
            ),
            child: Column(
              children: [
                HomeActivityItemWidget(
                  activityIcon: AppImages.addFile,
                  bgColor: AppColors.pinkLight,
                  title: "RelataProblema",
                  description: "Relate um problema na sua região.",
                  onTap: () {
                    Navigator.pushNamed(context, "/report", arguments: user);
                  },
                ),
                HomeActivityItemWidget(
                  activityIcon: AppImages.bookShelf,
                  bgColor: AppColors.yellowLight,
                  title: "EducaAmbiental",
                  description: "Infomações sobre deslizamentos de terra.",
                  onTap: () {
                    Navigator.pushNamed(context, "/ambient_education");
                  },
                ),
                HomeActivityItemWidget(
                  activityIcon: AppImages.chat,
                  bgColor: AppColors.purpleLight,
                  title: "Bate-papo",
                  description: "Compartilhe mensagens com outros moradores.",
                  onTap: () {
                    Navigator.pushNamed(context, "/chat", arguments: user);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
