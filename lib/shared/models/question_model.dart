import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  final String? title;
  final bool? isImageAnswer;
  final Map<String, dynamic>? answers;

  QuestionModel({this.title, this.isImageAnswer, this.answers});

  QuestionModel copyWith({
    String? title,
    bool? isImageAnswer,
    Map<String, dynamic>? answers,
  }) {
    return QuestionModel(
      title: title ?? this.title,
      isImageAnswer: isImageAnswer ?? this.isImageAnswer,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      'isImageAnswer': isImageAnswer,
      'answers': answers,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      isImageAnswer: map['isImageAnswer'],
      answers: map['answers'],
    );
  }

  factory QuestionModel.fromSnapshot(DocumentSnapshot doc) {
    return QuestionModel(
      title: doc['title'],
      isImageAnswer: doc['isImageAnswer'],
      answers: doc['answers'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuestionModel(title: $title, isImageAnswer: $isImageAnswer, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuestionModel &&
        other.title == title &&
        other.isImageAnswer == isImageAnswer &&
        other.answers == answers;
  }

  @override
  int get hashCode {
    return title.hashCode ^ isImageAnswer.hashCode ^ answers.hashCode;
  }
}
