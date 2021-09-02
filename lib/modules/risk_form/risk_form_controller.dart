import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos_deslizamentos/core/app_states.dart';
import 'package:sos_deslizamentos/modules/risk_form/risk_form_repository.dart';
import 'package:sos_deslizamentos/modules/risk_form/widgets/form_result/form_result_widget.dart';
import 'package:sos_deslizamentos/shared/auth/auth_controller.dart';
import 'package:sos_deslizamentos/shared/models/question_model.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';

class RiskFormController {
  final stateNotifier = ValueNotifier<AppState>(AppState.empty);
  set state(AppState state) => stateNotifier.value = state;
  AppState get state => stateNotifier.value;

  final currentPageNotifier = ValueNotifier<int>(1);
  set currentPage(int value) => currentPageNotifier.value = value;
  int get currentPage => currentPageNotifier.value;

  final selectedAnswerNotifier = ValueNotifier<int>(-1);
  set selectedAnswer(int value) => selectedAnswerNotifier.value = value;
  int get selectedAnswer => selectedAnswerNotifier.value;

  final userFormScoreNotifier = ValueNotifier<double>(0.0);
  set userFormScore(double value) => userFormScoreNotifier.value = value;
  double get userFormScore => userFormScoreNotifier.value;

  AuthController authController = AuthController();

  final repository = FormRepository();

  List<QuestionModel>? questions;

  Map<String, dynamic> formResponse = Map();

  double score = 0.0;

  void previousQuestion(PageController pageController) {
    if (currentPage > 1) {
      selectedAnswer = -1;
      pageController.previousPage(
          duration: Duration(milliseconds: 100), curve: Curves.linear);
    }
    return;
  }

  void nextQuestion(PageController pageController) {
    if (currentPage < questions!.length) {
      saveQuestionResponse();

      // print(formResponse);

      selectedAnswer = -1;
      pageController.nextPage(
          duration: Duration(milliseconds: 100), curve: Curves.linear);
    }
    return;
  }

  Future<void> registerResponses(BuildContext context, UserModel user) async {
    state = AppState.loading;
    saveQuestionResponse();

    double totalScore = 0.0;
    for (int i = 1; i <= questions!.length; i++) {
      totalScore = totalScore +
          double.parse(formResponse[i < 10 ? '0$i' : '$i']['score']);
    }
    formResponse['totalScore'] = num.parse(totalScore.toStringAsPrecision(2));
    formResponse['uid'] = user.uid;

    saveFinish(context, user);

    state = AppState.success;
  }

  Future<void> saveFinish(BuildContext context, UserModel user) async {
    state = AppState.loading;

    await saveResponses(user);
    await saveUserFormScore(formResponse['totalScore']);
    // print(user.riskFormId);

    if (user.riskFormId != null) {
      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => FormResultWidget(
                    user: user,
                    riskFormScore: formResponse['totalScore'],
                    pushedFrom: 1,
                  )));
    } else {
      final UserModel _newUser =
          await authController.updateCurrentUser(user.uid);
      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => FormResultWidget(
                    user: _newUser,
                    riskFormScore: formResponse['totalScore'],
                    pushedFrom: 0,
                  )));
    }

    // state = AppState.success;
  }

  void saveQuestionResponse() {
    formResponse[currentPage < 10 ? '0$currentPage' : '$currentPage'] = {
      'answer': '${selectedAnswer + 1}',
      'score': '$score',
    };
  }

  Future<void> saveResponses(UserModel user) async {
    if (user.riskFormId != null) {
      await FirebaseFirestore.instance
          .collection('formResponses')
          .doc(user.riskFormId)
          .set(formResponse);
    } else {
      await FirebaseFirestore.instance
          .collection('formResponses')
          .add(formResponse)
          .then((value) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({'riskFormId': value.id});
      });
    }
    return;
  }

  Future<void> saveUserFormScore(double score) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("userFormScore", score.toString());
    userFormScore = score;
    // print("saveUserFormScore\nuserFormScore:     $userFormScore");
    return;
  }

  Future<void> getUserFormScore(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    if (instance.containsKey("userFormScore")) {
      userFormScore = double.parse(instance.get("userFormScore") as String);
    } else if (user.riskFormId != null) {
      final result = await FirebaseFirestore.instance
          .collection('formResponses')
          .doc(user.riskFormId)
          .get();
      userFormScore = result['totalScore'];
      // print("userFormScore:     $userFormScore");
      // print("result['totalScore']:      ${result['totalScore']}");
      await saveUserFormScore(userFormScore);
    }
    return;
  }

  Future<void> getQuestions() async {
    state = AppState.loading;
    questions = await repository.getQuestions();
    state = AppState.success;
    return;
  }
}
