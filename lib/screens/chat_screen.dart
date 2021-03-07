import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sos_deslizamentos_app/models/user_model.dart';
import 'package:sos_deslizamentos_app/widgets/chat_message.dart';
import 'package:sos_deslizamentos_app/widgets/chat_text_composer.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Chat"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),

      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          return Column(
            children: [
              Divider(),

              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection('messages').orderBy('time').snapshots(),
                  builder: (context, snapshot){
                    switch(snapshot.connectionState){
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default: List<DocumentSnapshot> documents =
                          snapshot.data.documents.reversed.toList();

                        return ListView.builder(
                          itemCount: documents.length,
                          reverse: true,
                          itemBuilder: (context, index){
                            return ChatMessage(
                              documents[index].data,
                              documents[index].data['uid'] == model.user?.uid
                            );
                          },
                        );
                    }
                  },
                ),
              ),
              _isLoading ? LinearProgressIndicator() : Container(),
              Divider(),
              ChatTextComposer(model.sendMessage)
            ],
          );
        },
      ),
    );
  }
}
