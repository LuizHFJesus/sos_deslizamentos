import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/shared/auth/auth_controller.dart';
import 'package:sos_deslizamentos/shared/shared_widgets.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.currentUser(context);

    return Scaffold(
      backgroundColor: AppColors.appBackground,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: LogoWidget()),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.textThird),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Carregando...",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontFamily: AppFonts.light,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
