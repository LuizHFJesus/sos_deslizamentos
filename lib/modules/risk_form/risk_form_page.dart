import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/app_colors.dart';
import 'package:sos_deslizamentos/core/app_states.dart';
import 'package:sos_deslizamentos/modules/risk_form/risk_form_controller.dart';
import 'package:sos_deslizamentos/modules/risk_form/widgets/form_appbar/form_app_bar_widget.dart';
import 'package:sos_deslizamentos/modules/risk_form/widgets/question/question_widget.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';
import 'package:sos_deslizamentos/shared/shared_widgets.dart';

class RiskFormPage extends StatefulWidget {
  final UserModel user;
  RiskFormPage({Key? key, required this.user}) : super(key: key);

  @override
  _RiskFormPageState createState() => _RiskFormPageState();
}

class _RiskFormPageState extends State<RiskFormPage> {
  final controller = RiskFormController();
  final pageController = PageController();

  @override
  void initState() {
    controller.getQuestions();
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    controller.selectedAnswerNotifier.addListener(() {});
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(115),
        child: SafeArea(
          top: true,
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) => FormAppBarWidget(
              currentQuestion: value,
              formLength: controller.questions!.length,
              onTap: () => controller.previousQuestion(pageController),
            ),
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: controller.questions!
            .map((e) => QuestionWidget(
                  data: e,
                  controller: controller,
                ))
            .toList(),
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: controller.selectedAnswerNotifier,
        builder: (context, value, _) => controller.selectedAnswer != -1
            ? Container(
                height: 60,
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => FilledButtonWidget(
                    title: value == controller.questions!.length
                        ? "Finalizar"
                        : "Próximo",
                    onTap: () {
                      if (value < controller.questions!.length) {
                        controller.nextQuestion(pageController);
                      } else if (value == controller.questions!.length) {
                        controller.registerResponses(context, widget.user);
                      }
                    },
                  ),
                ),
              )
            : Container(height: 0),
      ),
    );
  }
}
