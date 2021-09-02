import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class AnswerModel {
  final String? title;
  final String? image;
  final double? score;

  AnswerModel({
    this.title,
    this.image,
    this.score,
  });

  AnswerModel copyWith({
    String? title,
    String? image,
    double? score,
  }) {
    return AnswerModel(
      title: title ?? this.title,
      image: image ?? this.image,
      score: score ?? this.score,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'score': score,
    };
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      title: map['title'],
      image: map['image'],
      score: map['score'] == 0 ? 0.0 : map['score'],
    );
  }

  factory AnswerModel.fromSnapshot(DocumentSnapshot doc) {
    return AnswerModel(
      title: doc['title'],
      image: doc['image'],
      score: doc['score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) =>
      AnswerModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AnswerModel(title: $title, image: $image, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnswerModel &&
        other.title == title &&
        other.image == image &&
        other.score == score;
  }

  @override
  int get hashCode {
    return title.hashCode ^
    image.hashCode ^
    score.hashCode;
  }
}