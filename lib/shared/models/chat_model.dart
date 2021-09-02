import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String? senderName;
  final String? senderPhoto;
  final String? senderUid;
  final String? text;
  final String? image;
  final Timestamp? time;

  ChatModel({
    this.senderName,
    this.senderPhoto,
    this.senderUid,
    this.text,
    this.image,
    this.time,
  });

  ChatModel copyWith({
    String? senderName,
    String? senderPhoto,
    String? senderUid,
    String? text,
    String? image,
    Timestamp? time,
  }) {
    return ChatModel(
      senderName: senderName ?? this.senderName,
      senderPhoto: senderPhoto ?? this.senderPhoto,
      senderUid: senderUid ?? this.senderUid,
      text: text ?? this.text,
      image: image ?? this.image,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "senderName": senderName,
      'senderPhoto': senderPhoto,
      'senderUid': senderUid,
      'text': text,
      'image': image,
      'time': time,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      senderName: map['senderName'],
      senderPhoto: map['senderPhoto'],
      senderUid: map['senderUid'],
      text: map['text'],
      image: map['image'],
      time: map['time'],
    );
  }

  factory ChatModel.fromSnapshot(DocumentSnapshot doc) {
    return ChatModel(
      senderName: doc['senderName'],
      senderPhoto: doc['senderPhoto'],
      senderUid: doc['senderUid'],
      text: doc['text'],
      image: doc['image'],
      time: doc['time'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromSnapshot(json.decode(source));

  @override
  String toString() {
    return 'ChatModel(senderName: $senderName, senderPhoto: $senderPhoto, senderUid: $senderUid, text: $text, image: $image, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatModel &&
        other.senderName == senderName &&
        other.senderPhoto == senderPhoto &&
        other.senderUid == senderUid &&
        other.text == text &&
        other.image == image &&
        other.time == time;
  }

  @override
  int get hashCode {
    return senderName.hashCode ^
        senderPhoto.hashCode ^
        senderUid.hashCode ^
        text.hashCode ^
        image.hashCode ^
        time.hashCode;
  }
}
