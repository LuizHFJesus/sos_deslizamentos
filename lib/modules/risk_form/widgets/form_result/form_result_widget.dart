import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';
import 'package:sos_deslizamentos/shared/shared_widgets.dart';

class FormResultWidget extends StatefulWidget {
  final UserModel user;
  // final bool isFirstFormId;
  final int pushedFrom;
  final double riskFormScore;

  const FormResultWidget({
    Key? key,
    required this.user,
    // this.isFirstFormId = false,
    required this.pushedFrom,
    required this.riskFormScore,
  }) : super(key: key);

  @override
  _FormResultWidgetState createState() => _FormResultWidgetState();
}

class _FormResultWidgetState extends State<FormResultWidget> {
  @override
  Widget build(BuildContext context) {
    Color? _scoreColor;
    String? _scoreText;
    String? _scoreDescription;

    // Calculation of RiskFormScore
    if (widget.riskFormScore >= 0 && widget.riskFormScore <= 2.0) {
      _scoreColor = AppColors.green;
      _scoreText = "BAIXO";
      // _scoreDescription = "Texto para nível de risco 'BAIXO'";
      _scoreDescription = "";
    } else if (widget.riskFormScore <= 4.0) {
      _scoreColor = AppColors.yellow;
      _scoreText = "MÉDIO";
      // _scoreDescription = "Texto para nível de risco 'MÉDIO'";
      _scoreDescription = "";
    } else if (widget.riskFormScore <= 6.0) {
      _scoreColor = AppColors.orange;
      _scoreText = "ALTO";
      // _scoreDescription = "Texto para nível de risco 'ALTO'";
      _scoreDescription = "";
    } else if (widget.riskFormScore <= 7.0) {
      _scoreColor = AppColors.red;
      _scoreText = "ALERTA MÁXIMO";
      // _scoreDescription = "Texto para nível de risco 'ALERTA MÁXIMO'";
      _scoreDescription = "";
    } else {
      _scoreColor = AppColors.textSecondary;
      _scoreText = "INVÁLIDO";
      _scoreDescription = "";
      print("ERROR: Invalid value to riskLevel.");
    }

    return Scaffold(
      backgroundColor: AppColors.appBackground,
      body: SafeArea(
        child: Center(
          child: DefaultPageWidget(children: [
            RiskLevelCardWidget(user: widget.user, isInFormResult: true),
            SizedBox(height: 30),
            Text(
              "O seu nível de risco é",
              style: TextStyle(
                color: AppColors.textPrimary,
                fontFamily: AppFonts.regular,
                fontSize: 20,
              ),
            ),
            Text(
              _scoreText,
              style: TextStyle(
                color: _scoreColor,
                fontFamily: AppFonts.semiBold,
                fontSize: 24,
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _scoreDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textThird,
                fontFamily: AppFonts.regular,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 50),
            FilledButtonWidget(
              title: "Continuar",
              onTap: () {
                if (widget.pushedFrom == 0 /* First form response */) {
                  Navigator.pushReplacementNamed(context, '/home',
                      arguments: widget.user);
                } else if (widget.pushedFrom == 1 /* Update form response */) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/home',
                      arguments: widget.user);
                  Navigator.pushNamed(context, '/settings',
                      arguments: widget.user);
                  Navigator.pushNamed(context, '/risk_form_settings',
                      arguments: widget.user);
                } else if (widget.pushedFrom == 2 /* RiskLevelCardWidget */) {
                  Navigator.pop(context);
                }

                // TODO: Back to this logic.
                // widget.firstFormId
                //     ? Navigator.pushReplacementNamed(context, '/home',
                //         arguments: widget.user)
                //     : Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
