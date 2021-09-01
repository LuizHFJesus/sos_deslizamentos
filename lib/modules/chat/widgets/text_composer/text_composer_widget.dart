import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/modules/chat/chat_controller.dart';
import 'package:sos_deslizamentos/shared/models/user_model.dart';

class TextComposerWidget extends StatefulWidget {
  final ChatController controller;
  final UserModel user;

  TextComposerWidget({
    Key? key,
    required this.controller,
    required this.user,
  }) : super(key: key);

  @override
  _TextComposerWidgetState createState() => _TextComposerWidgetState();
}

class _TextComposerWidgetState extends State<TextComposerWidget> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _composerController = TextEditingController();

  bool _isComposing = false;

  void _reset() {
    _composerController.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: TextField(
        controller: _composerController,
        onChanged: (text) {
          setState(() {
            _isComposing = text.isNotEmpty;
          });
        },
        onSubmitted: (text) {
          widget.controller.sendMessage(text: text, user: widget.user);
          _reset();
        },
        textCapitalization: TextCapitalization.sentences,
        style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16.0,
            fontFamily: AppFonts.regular),
        keyboardType: TextInputType.text,
        minLines: 1,
        maxLines: 5,
        decoration: InputDecoration(
          prefixIcon: GestureDetector(
            onTap: () async {
              final imgFile = await ImagePicker()
                  .getImage(source: ImageSource.gallery, imageQuality: 80);
              if (imgFile == null) return;
              widget.controller
                  .sendMessage(imgFile: File(imgFile.path), user: widget.user);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: SvgPicture.asset(AppImages.sendImage),
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: _isComposing
                ? () {
                    widget.controller
                        .sendMessage(text: _composerController.text, user: widget.user);
                    _reset();
                  }
                : null,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: SvgPicture.asset(AppImages.sendMessage,
                  color: _isComposing ? AppColors.primary : null),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20),
          hintText: "Escreva uma mensagem...",
          hintStyle: TextStyle(color: AppColors.textThird),
          filled: true,
          fillColor: AppColors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.greyLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
