import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sos_deslizamentos/shared/models/ambient_education_model.dart';

class AmbientEducationRepository {
  Future<List<AmbientEducationModel>> getAmbientEducation() async {
    final response =
        await FirebaseFirestore.instance.collection('ambientEducation').get();
    final ambientEducation =
        response.docs.map((e) => AmbientEducationModel.fromFireStore(e)).toList();
    return ambientEducation;
  }
}
