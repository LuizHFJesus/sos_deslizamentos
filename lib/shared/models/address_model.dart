import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  final String? state;
  final String? city;
  final String? bairro;
  final String? uid;

  AddressModel({
    this.state,
    this.city,
    this.bairro,
    this.uid,
  });

  AddressModel copyWith({
    String? state,
    String? city,
    String? bairro,
    String? uid,
  }) {
    return AddressModel(
      state: state ?? this.state,
      city: city ?? this.city,
      bairro: bairro ?? this.bairro,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "state": state,
      "city": city,
      "bairro": bairro,
      "uid": uid,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      state: map['state'],
      city: map['city'],
      bairro: map['bairro'],
      uid: map['uid'],
    );
  }

  String toJson() => jsonEncode(toMap());

  factory AddressModel.fromJson(String json) =>
      AddressModel.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'AddressModel(state: $state, city: $city, bairro: $bairro, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddressModel &&
        other.state == state &&
        other.city == city &&
        other.bairro == bairro &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return state.hashCode ^ city.hashCode ^ bairro.hashCode ^ uid.hashCode;
  }

  factory AddressModel.fromFireStore(DocumentSnapshot doc) {
    return AddressModel(
      state: doc['state'],
      city: doc['city'],
      bairro: doc['bairro'],
      uid: doc['uid'],
    );
  }
}
