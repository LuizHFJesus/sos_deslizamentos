import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sos_deslizamentos/core/app_states.dart';
import 'package:sos_deslizamentos/shared/models/report_model.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';

class ReportController {
  final stateNotifier = ValueNotifier<AppState>(AppState.empty);
  set state(AppState state) => stateNotifier.value = state;
  AppState get state => stateNotifier.value;

  final formKey = GlobalKey<FormState>();
  ReportModel report = ReportModel();

  String? validateCategory(String? value) => value?.isEmpty ?? true
      ? "O campo 'Categoria' precisa ser preenchido"
      : null;

  String? validateDescription(String? value) => value?.isEmpty ?? true
      ? "O campo 'Descrição' precisa ser preenchido"
      : null;

  void onChange({
    String? category,
    String? image,
    String? description,
    Timestamp? time,
    String? uid,
  }) {
    report = report.copyWith(
      category: category,
      image: image,
      description: description,
      time: Timestamp.now(),
      uid: uid,
    );
  }

  Future<void> registerReport(BuildContext context, UserModel user) async {
    state = AppState.loading;
    final form = formKey.currentState;
    if (form!.validate()) {
      onChange(uid: user.uid);
      try {
        await FirebaseFirestore.instance
            .collection('reports')
            .add(report.toMap());
        await Navigator.pushNamed(context, "/result",
            arguments: true); // TODO: Verify if all is really ok!
      } catch (e) {
        await Navigator.pushNamed(context, "/result",
            arguments: false); // TODO: Verify if all is really ok!
      }
    }
    state = AppState.success;
    return;
  }
}
