import 'package:cloud_firestore/cloud_firestore.dart';

class AmbientEducationData {

  String id;
  String image;
  String title;
  String description;

  AmbientEducationData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    image = snapshot.data['image'];
    title = snapshot.data['title'];
    description = snapshot.data['description'];
  }

}