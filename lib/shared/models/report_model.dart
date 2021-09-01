import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ReportModel {
  final String? category;
  final String? image;
  final String? description;
  final Timestamp? time;
  final String? uid;

  ReportModel({
    this.category,
    this.image,
    this.description,
    this.time,
    this.uid,
  });

  ReportModel copyWith({
    String? category,
    String? image,
    String? description,
    Timestamp? time,
    String? uid,
  }) {
    return ReportModel(
      category: category ?? this.category,
      image: image ?? this.image,
      description: description ?? this.description,
      time: time ?? this.time,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "category": category,
      "image": image,
      "description": description,
      "time": time,
      "uid": uid,
    };
  }

  factory ReportModel.fromMap(Map<String, dynamic> map) {
    return ReportModel(
      category: map['category'],
      image: map['image'],
      description: map['description'],
      time: map['time'],
      uid: map['uid'],
    );
  }

  String toJson() => jsonEncode(toMap());

  factory ReportModel.fromJson(String json) =>
      ReportModel.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'AddressModel(category: $category, image: $image, description: $description, time: $time, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReportModel &&
        other.category == category &&
        other.image == image &&
        other.description == description &&
        other.time == time &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return category.hashCode ^
        image.hashCode ^
        description.hashCode ^
        time.hashCode ^
        uid.hashCode;
  }

  factory ReportModel.fromFireStore(DocumentSnapshot doc) {
    return ReportModel(
      category: doc['category'],
      image: doc['image'],
      description: doc['description'],
      time: doc['time'],
      uid: doc['uid'],
    );
  }
}