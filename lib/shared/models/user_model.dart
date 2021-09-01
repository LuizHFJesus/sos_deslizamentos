import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String photoUrl;
  final String? addressId;
  final String? riskFormId;
  // final List<String> reports;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoUrl,
    this.addressId,
    this.riskFormId,
    // required this.modules.report
  });

  Map<String, dynamic> toMap() => {
        "uid": uid,
        "name": name,
        "email": email,
        "photoUrl": photoUrl,
        "addressId": addressId,
        "riskFormId": riskFormId,
      };

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      photoUrl: map['photoUrl'],
      addressId: map['addressId'],
      riskFormId: map['riskFormId'],
    );
  }

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));

  factory UserModel.fromFireStore(DocumentSnapshot doc) {
    return UserModel(
      uid: doc['uid'],
      name: doc['name'],
      email: doc['email'],
      photoUrl: doc['photoUrl'],
      addressId: doc['addressId'],
      riskFormId: doc['riskFormId'],
    );
  }
}
