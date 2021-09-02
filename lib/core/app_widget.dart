import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/modules/address_register/address_register_page.dart';
import 'package:sos_deslizamentos/modules/ambient_education/ambient_education_page.dart';
import 'package:sos_deslizamentos/modules/chat/chat_page.dart';
import 'package:sos_deslizamentos/modules/connect_account/connect_account_page.dart';
import 'package:sos_deslizamentos/modules/home/home_page.dart';
import 'package:sos_deslizamentos/modules/profile_settings/profile_settings_page.dart';
import 'package:sos_deslizamentos/modules/report/report_page.dart';
import 'package:sos_deslizamentos/modules/result/result_page.dart';
import 'package:sos_deslizamentos/modules/risk_form/risk_form_page.dart';
import 'package:sos_deslizamentos/modules/risk_form_settings/risk_form_settings_page.dart';
import 'package:sos_deslizamentos/modules/settings/settings_page.dart';
import 'package:sos_deslizamentos/modules/sign_in/sign_in_page.dart';
import 'package:sos_deslizamentos/modules/sign_up/sign_up_page.dart';
import 'package:sos_deslizamentos/modules/splash/splash_page.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SOS Deslizamentos",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        backgroundColor: AppColors.appBackground,
        dividerColor: AppColors.greyLight,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/connect_account": (context) => ConnectAccountPage(),
        "/sign_in": (context) => SignInPage(),
        "/sign_up": (context) => SignUpPage(),
        "/address_register": (context) => AddressRegisterPage(
            user: ModalRoute.of(context)!.settings.arguments as UserModel),
        "/risk_form": (context) => RiskFormPage(
            user: ModalRoute.of(context)!.settings.arguments as UserModel),
        "/home": (context) => HomePage(
            user: ModalRoute.of(context)!.settings.arguments as UserModel),
        "/report": (context) => ReportPage(
            user: ModalRoute.of(context)!.settings.arguments as UserModel),
        "/ambient_education": (context) => AmbientEducationPage(),
        "/chat": (context) => ChatPage(
            user: ModalRoute.of(context)!.settings.arguments as UserModel),
        "/settings": (context) => SettingsPage(
            user: ModalRoute.of(context)!.settings.arguments as UserModel),
        "/profile_settings": (context) => ProfileSettingsPage(
            user: ModalRoute.of(context)!.settings.arguments as UserModel),
        "/risk_form_settings": (context) => RiskFormSettingsPage(
            user: ModalRoute.of(context)!.settings.arguments as UserModel),
        "/result": (context) => ResultPage(
            result: ModalRoute.of(context)!.settings.arguments as bool),
        // "/change_password": (context) =>
        //     ChangePasswordPage(forgetPassword: true),
      },
    );
  }
}
