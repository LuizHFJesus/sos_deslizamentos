import 'package:cloud_firestore/cloud_firestore.dart';

class AmbientEducationModel {
  final String title;
  final String description;
  final String image;

  AmbientEducationModel({
    required this.title,
    required this.description,
    required this.image
  });

  factory AmbientEducationModel.fromFireStore(DocumentSnapshot doc) {
    return AmbientEducationModel(
      title: doc['title'],
      description: doc['description'],
      image: doc['image']
    );
  }
}