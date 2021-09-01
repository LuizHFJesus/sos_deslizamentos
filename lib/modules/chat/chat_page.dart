import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/modules/chat/chat_controller.dart';
import 'package:sos_deslizamentos/modules/chat/widgets/message/message_widget.dart';
import 'package:sos_deslizamentos/modules/chat/widgets/text_composer/text_composer_widget.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';
import 'package:sos_deslizamentos/shared/shared_widgets.dart';

class ChatPage extends StatefulWidget {
  final UserModel user;

  const ChatPage({Key? key, required this.user}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final controller = ChatController();

  @override
  void initState() {
    controller.getChatStream();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
          typeLeftButton: "back",
          onTappedLeftButton: () {
            Navigator.pop(context);
          },
          onTappedRightButton: () {}),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: controller.chatStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return CircularProgressWidget();

                  default:
                    return ListView(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      reverse: true,
                      children: snapshot.data!.docs.reversed
                          .map((DocumentSnapshot e) => MessageWidget(
                              doc: e,
                              isMine: e['senderUid'] == widget.user.uid))
                          .toList(),
                    );
                }
              },
            ),
          ),
          if (controller.state == AppState.loading) LinearProgressIndicator(),
          TextComposerWidget(controller: controller, user: widget.user)
        ],
      ),
    );
  }
}
