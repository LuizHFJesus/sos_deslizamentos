import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/modules/connect_account/connect_account_controller.dart';
import 'package:sos_deslizamentos/shared/shared_widgets.dart';

class ConnectAccountPage extends StatefulWidget {
  @override
  _ConnectAccountPageState createState() => _ConnectAccountPageState();
}

class _ConnectAccountPageState extends State<ConnectAccountPage> {
  final controller = ConnectAccountController();

  @override
  void initState() {
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == AppState.loading)
      return Scaffold(
          backgroundColor: AppColors.appBackground,
          body: CircularProgressWidget());

    return Scaffold(
      backgroundColor: AppColors.appBackground,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoWidget(),
              SizedBox(height: 70),
              // OutlinedButtonWidget(
              //   title: "Entrar",
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(
              //         builder: (context) => SignInPage()));
              //   },
              // ),
              // SizedBox(height: 30),
              // FilledButtonWidget(
              //   title: "Criar Conta",
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(
              //         builder: (context) => SignUpPage()));
              //   }
              // ),
              // SizedBox(height: 40),
              // Text("Ou conecte-se com...",
              //     style: TextStyle(
              //       color: AppColors.textPrimary,
              //       fontFamily: AppFonts.regular,
              //       fontSize: 12,
              //     )),
              // SizedBox(height: 20),
              OutlinedButtonWidget(
                  title: "Entrar com Google",
                  icon: AppImages.google,
                  onTap: () {
                    controller.googleSignIn(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
