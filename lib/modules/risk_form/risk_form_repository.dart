import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sos_deslizamentos/shared/models/question_model.dart';

class FormRepository {
  Future<List<QuestionModel>> getQuestions() async {
    // TODO: Save/Get questions in/from SharedPreferences, just after all questions are confirmed.
    // final instance = await SharedPreferences.getInstance();

    final response =
        await FirebaseFirestore.instance.collection('riskform').get();
    List<QuestionModel> questions =
        response.docs.map((e) => QuestionModel.fromSnapshot(e)).toList();
    return questions;
  }
}
