import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/modules/risk_form/risk_form_controller.dart';
import 'package:sos_deslizamentos/modules/risk_form/widgets/image_answer/image_answer_widget.dart';
import 'package:sos_deslizamentos/modules/risk_form/widgets/text_answer/text_answer_widget.dart';
import 'package:sos_deslizamentos/shared/models/answer_model.dart';
import 'package:sos_deslizamentos/shared/models/question_model.dart';

class QuestionWidget extends StatefulWidget {
  final QuestionModel data;
  final RiskFormController controller;

  QuestionWidget({
    Key? key,
    required this.data,
    required this.controller,
  }) : super(key: key);

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> answers = widget.data.answers!;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: Text(
                widget.data.title!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontFamily: AppFonts.semiBold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          ValueListenableBuilder<int>(
            valueListenable: widget.controller.selectedAnswerNotifier,
            builder: (context, value, _) => Expanded(
              child: widget.data.isImageAnswer == true
                  ? GridView.builder(
                      padding: EdgeInsets.all(20),
                      itemCount: answers.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          maxCrossAxisExtent: 200),
                      shrinkWrap: true,
                      itemBuilder: (_, int index) {
                        return ImageAnswerWidget(
                          image: AnswerModel.fromMap(answers['$index']).image!,
                          isSelected: widget.controller.selectedAnswer == index
                              ? true
                              : false,
                          onTap: () {
                            widget.controller.selectedAnswer = index;
                          },
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: answers.length,
                      padding: EdgeInsets.all(20),
                      itemBuilder: (_, int index) {
                        return TextAnswerWidget(
                          title: AnswerModel.fromMap(answers['$index']).title!,
                          isSelected: widget.controller.selectedAnswer == index
                              ? true
                              : false,
                          onTap: () {
                            widget.controller.selectedAnswer = index;
                            widget.controller.score = AnswerModel.fromMap(answers['$index']).score!;
                          },
                        );
                      },
                    ),
            ),
          )
        ],
      ),
    );
  }
}
