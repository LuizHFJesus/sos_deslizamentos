import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';
import 'package:sos_deslizamentos/shared/shared_widgets.dart';

class RiskFormSettingsPage extends StatelessWidget {
  final UserModel user;

  const RiskFormSettingsPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBarWidget(
          typeLeftButton: "back",
          onTappedLeftButton: () {
            Navigator.pop(context);
          },
          onTappedRightButton: () {}),
      body: DefaultPageWidget(children: [
        TextHeaderWidget(label: "Formulário de\nRisco"),
        RiskLevelCardWidget(user: user),
        SizedBox(height: 20),
        if (user.riskFormId != null) //isFilled
          SimpleButtonWidget(
            onTapped: () {
              Navigator.pushNamed(context, "/risk_form", arguments: user); // TODO: Back to pushNamed after fix card refresh.
              // Navigator.pushReplacementNamed(context, "/risk_form", arguments: user);
            },
            title: "Refazer",
            icon: AppImages.angleRight,
          ),
      ]),
    );
  }
}
