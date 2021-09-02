import 'package:flutter/foundation.dart';
import 'package:sos_deslizamentos/core/app_states.dart';
import 'package:sos_deslizamentos/modules/ambient_education/ambient_education_repository.dart';
import 'package:sos_deslizamentos/shared/models/ambient_education_model.dart';

class AmbientEducationController {
  final stateNotifier = ValueNotifier<AppState>(AppState.empty);
  set state(AppState state) => stateNotifier.value = state;
  AppState get state => stateNotifier.value;

  List<AmbientEducationModel>? ambientEducation;

  final repository = AmbientEducationRepository();

  void getAmbientEducation() async {
    state = AppState.loading;
    ambientEducation = await repository.getAmbientEducation();
    state = AppState.success;
  }
}