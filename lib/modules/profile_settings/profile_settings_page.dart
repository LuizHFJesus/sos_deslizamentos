import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/modules/profile_settings/widgets/change_profile_picture/change_profile_picture_widget.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';
import 'package:sos_deslizamentos/shared/shared_widgets.dart';

class ProfileSettingsPage extends StatelessWidget {
  final UserModel user;

  const ProfileSettingsPage({Key? key, required this.user}) : super(key: key);

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
          TextHeaderWidget(label: "Informações de\nUsuário"),
          ChangeProfilePictureWidget(photoUrl: user.photoUrl),
          SizedBox(height: 20),
          TextFieldWidget(
            labelText: "Nome",
            keyboardType: TextInputType.name,
            initialValue: user.name,
            enabled: false,
            validator: (value) => (value?.isEmpty ?? true ? "" : null),
            onChanged: (value) {},
          ),
          SizedBox(height: 20),
          TextFieldWidget(
            labelText: "E-mail",
            keyboardType: TextInputType.emailAddress,
            initialValue: user.email,
            enabled: false,
            validator: (value) => (value?.isEmpty ?? true ? "" : null),
            onChanged: (value) {},
          ),
          SizedBox(height: 20),
          SimpleButtonWidget(
            onTapped: () {
              Navigator.pushNamed(context, "/address_register",
                  arguments: user);
            },
            title: "Alterar Endereço",
            icon: AppImages.angleRight,
          ),
          SizedBox(height: 20),
          // SimpleButtonWidget(
          //   onTapped: () {},
          //   title: "Alterar Senha",
          //   icon: AppImages.angleRight,
          // ),
          // SizedBox(height: 30),
          // FilledButtonWidget(
          //   title: "Salvar",
          //   onTap: () {},
          // )
        ]));
  }
}
