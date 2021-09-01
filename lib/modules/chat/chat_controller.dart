import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:sos_deslizamentos/core/app_states.dart';
import 'package:sos_deslizamentos/modules/chat/chat_repository.dart';
import 'package:sos_deslizamentos/shared/models/chat_model.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';

class ChatController {
  final stateNotifier = ValueNotifier<AppState>(AppState.empty);
  set state(AppState state) => stateNotifier.value = state;
  AppState get state => stateNotifier.value;

  Stream<QuerySnapshot>? chatStream;
  List<ChatModel>? chat;

  final repository = ChatRepository();

  void getChatStream() async {
    state = AppState.loading;
    chatStream = await repository.getStream();
    state = AppState.success;
  }

  Future<Null> sendMessage(
      {String? text, imgFile, required UserModel user}) async {
    if (text == "" && imgFile == null) return;

    state = AppState.loading;

    ChatModel message = ChatModel();
    String? image;

    if (imgFile != null) {
      UploadTask task = FirebaseStorage.instance
          .ref()
          .child(user.uid + DateTime.now().millisecondsSinceEpoch.toString())
          .putFile(imgFile);
      TaskSnapshot taskSnapshot = await task.whenComplete(() {});
      image = await taskSnapshot.ref.getDownloadURL();
    }

    message = message.copyWith(
      senderName: user.name,
      senderPhoto: user.photoUrl,
      senderUid: user.uid,
      text: text,
      image: image,
      time: Timestamp.now(),
    );

    await FirebaseFirestore.instance
        .collection('messages')
        .add(message.toMap());

    state = AppState.success;

    return;
  }
}
