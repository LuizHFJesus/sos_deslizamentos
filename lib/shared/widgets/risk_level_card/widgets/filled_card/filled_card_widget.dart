import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/modules/risk_form/risk_form_controller.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';

class FilledCardWidget extends StatefulWidget {
  final UserModel user;

  const FilledCardWidget({Key? key, required this.user}) : super(key: key);

  @override
  _FilledCardWidgetState createState() => _FilledCardWidgetState();
}

class _FilledCardWidgetState extends State<FilledCardWidget> {
  final _controller = RiskFormController();

  @override
  void initState() {
    //TODO: Check why it's not updating.
    // print("passou por aqui 1");
    _controller.getUserFormScore(widget.user);
    // print("score:  ${_controller.userFormScore}");
    _controller.userFormScoreNotifier.addListener(() {
      // print(_controller.userFormScore);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color? _scoreColor;
    String? _scoreText;

    // Calculation of RiskFormScore
    if (_controller.userFormScore >= 0 && _controller.userFormScore <= 2.0) {
      _scoreColor = AppColors.green;
      _scoreText = "BAIXO";
    } else if (_controller.userFormScore <= 4.0) {
      _scoreColor = AppColors.yellow;
      _scoreText = "MÉDIO";
    } else if (_controller.userFormScore <= 6.0) {
      _scoreColor = AppColors.orange;
      _scoreText = "ALTO";
    } else if (_controller.userFormScore <= 7.0) {
      _scoreColor = AppColors.red;
      _scoreText = "ALERTA MÁXIMO";
    } else {
      _scoreColor = AppColors.white;
      _scoreText = "INVÁLIDO";
      print("ERROR: Invalid value to riskLevel.");
    }

    String getPoints(double userFormScore) {
      double points = (userFormScore / 7) * 100;
      if (points < 10.0) {
        return points.toStringAsPrecision(1);
      } else if (points < 100.0) {
        return points.toStringAsPrecision(2);
      } else if (points == 100.0) {
        return "100";
      } else {
        return "ERRO";
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            // margin: EdgeInsets.fromLTRB(5, 5, 25, 5),
            height: 100,
            width: 100,
            child: Stack(children: [
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    strokeWidth: 7,
                    value: (_controller.userFormScore / 7),
                    backgroundColor: AppColors.greyLight,
                    valueColor: AlwaysStoppedAnimation<Color>(_scoreColor),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getPoints(_controller.userFormScore),
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontFamily: AppFonts.medium,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Pontos",
                      style: TextStyle(
                        color: AppColors.textThird,
                        fontFamily: AppFonts.regular,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
        Expanded(
          child: Column(children: [
            Text(
              "O seu nível de risco é:",
              style: TextStyle(
                color: AppColors.textPrimary,
                fontFamily: AppFonts.regular,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 25),
            Text(
              "$_scoreText", // auto
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _scoreColor, // auto
                fontFamily: AppFonts.semiBold,
                fontSize: 18,
              ),
            ),
          ]),
        )
      ],
    );
  }
}
