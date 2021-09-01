import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/shared/shared_widgets.dart';

class MessageWidget extends StatelessWidget {
  final DocumentSnapshot doc;
  final bool isMine;

  MessageWidget({
    Key? key,
    required this.doc,
    required this.isMine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:
          isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(bottom: 15),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
          decoration: BoxDecoration(
            color: isMine ? AppColors.primary : AppColors.white,
            border: Border.all(
                color: isMine ? AppColors.primary : AppColors.greyLight),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [AppShadows.shadowSmall],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:
                isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!isMine)
                Expanded(
                  flex: 0,
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          doc['senderPhoto'],
                        ),
                      ),
                    ),
                  ),
                ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: isMine
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    if (!isMine)
                      Text(
                        doc['senderName'],
                        textWidthBasis: TextWidthBasis.longestLine,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontFamily: AppFonts.medium,
                          fontSize: 14,
                        ),
                      ),
                    if (!isMine) SizedBox(height: 5),
                    doc['image'] == null
                        ? Text(
                            doc['text'],
                            textWidthBasis: TextWidthBasis.longestLine,
                            style: TextStyle(
                              color: isMine
                                  ? AppColors.white
                                  : AppColors.textThird,
                              fontFamily: AppFonts.regular,
                              fontSize: 12,
                            ),
                          )
                        : Image.network(
                            doc['image'],
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.center,
                                child: CircularProgressWidget(
                                  color: AppColors.white,
                                ),
                              );
                            },
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
