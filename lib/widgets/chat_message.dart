import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  ChatMessage(this.data, this.mine);

  final Map<String, dynamic> data;
  final bool mine;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: [
          !mine ?
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  data['senderPhotoUrl']
                ),
              ),
            ) : Container(),

          Expanded(
            child: Column(
              crossAxisAlignment: mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                !mine ? Text(
                  data['senderName'],
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor
                  ),
                ) : Container(),

                data['imgUrl'] != null ?
                  Image.network(data['imgUrl'], width: 170.0,)
                : Text(
                  data['text'],
                  textAlign: mine ? TextAlign.end : TextAlign.start,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          mine ?
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                data['senderPhotoUrl']
              ),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}
