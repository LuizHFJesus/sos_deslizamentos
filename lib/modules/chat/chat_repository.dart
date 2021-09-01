import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepository {
  Future<Stream<QuerySnapshot>> getStream() async {
    final chatStream = FirebaseFirestore.instance
        .collection('messages')
        .orderBy('time')
        .snapshots();
    return chatStream;
  }
}
