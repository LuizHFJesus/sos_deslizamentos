import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestion;

  const QuestionIndicatorWidget({
    Key? key,
    required this.currentQuestion,
    required this.totalQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Questão ${currentQuestion < 10 ? "0$currentQuestion" : currentQuestion}",
              style: TextStyle(
                color: AppColors.textPrimary,
                fontFamily: AppFonts.regular,
                fontSize: 14,
              ),
            ),
            Text(
              "de $totalQuestion",
              style: TextStyle(
                color: AppColors.textPrimary,
                fontFamily: AppFonts.regular,
                fontSize: 14,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        LinearProgressIndicator(
          value: currentQuestion / totalQuestion,
          backgroundColor: AppColors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
        )
      ]),
    );
  }
}
