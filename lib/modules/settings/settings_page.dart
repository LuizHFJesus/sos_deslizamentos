import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/modules/connect_account/connect_account_controller.dart';
import 'package:sos_deslizamentos/modules/settings/widgets/settings_activity_item/settings_activity_item_widget.dart';
import 'package:sos_deslizamentos/modules/settings/widgets/user_info/user_info_widget.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';
import 'package:sos_deslizamentos/shared/shared_widgets.dart';

class SettingsPage extends StatelessWidget {
  final UserModel user;

  SettingsPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accountController = ConnectAccountController();

    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBarWidget(
        typeLeftButton: "back",
        onTappedLeftButton: () {
          Navigator.pop(context);
        },
        typeRightButton: "sign_out",
        onTappedRightButton: () {
          accountController.googleSignOut(context);
        },
      ),
      body: DefaultPageWidget(
        children: [
          UserInfoWidget(user: user), // user info
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.greyLight),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [AppShadows.shadowBig],
            ),
            child: Column(
              children: [
                SettingsActivityItemWidget(
                  activityIcon: AppImages.profile,
                  title: "Perfil",
                  description: "Informações de usuário.",
                  onTap: () {
                    Navigator.pushNamed(context, "/profile_settings",
                        arguments: user);
                  },
                ),
                // Divider(height: 1),
                // SettingsActivityItemWidget(
                //   activityIcon: AppImages.notifications,
                //   title: "Meus Relatos",
                //   description: "Visualize os seus relatos.",
                //   onTap: (){},
                // ),
                Divider(height: 1),
                SettingsActivityItemWidget(
                  activityIcon: AppImages.settings,
                  title: "Formulário de Risco",
                  description: "Informações do formulário.",
                  onTap: () {
                    Navigator.pushNamed(context, "/risk_form_settings", arguments: user);
                  },
                ),
                Divider(height: 1),
                SettingsActivityItemWidget(
                  activityIcon: AppImages.signOut,
                  title: "Sair",
                  description: "Sair da conta.",
                  onTap: () {
                    accountController.googleSignOut(context);
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
