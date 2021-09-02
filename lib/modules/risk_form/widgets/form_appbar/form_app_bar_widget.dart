import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/modules/risk_form/widgets/question_indicator/question_indicator_widget.dart';

class FormAppBarWidget extends StatelessWidget {
  final int currentQuestion;
  final int formLength;
  final VoidCallback onTap;

  const FormAppBarWidget({
    Key? key,
    required this.currentQuestion,
    required this.formLength,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Column(
        children: [
          QuestionIndicatorWidget(
            currentQuestion: currentQuestion,
            totalQuestion: formLength,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (currentQuestion > 1)
                Container(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: onTap,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: SvgPicture.asset(AppImages.arrowLeft),
                      ),
                    ),
                  ),
                ),

              // TODO: Help card in risk form.
              // Container(
              //   alignment: Alignment.centerRight,
              //   child: GestureDetector(
              //     onTap: () {},
              //     child: Container(
              //       height: 40,
              //       width: 40,
              //       decoration: BoxDecoration(
              //           color: AppColors.grey,
              //           borderRadius: BorderRadius.circular(14)),
              //       child: Center(
              //         child: SvgPicture.asset(AppImages.questionMark),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }
}
