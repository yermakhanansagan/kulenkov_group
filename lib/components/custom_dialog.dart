import 'package:flutter/material.dart';

import 'package:kulenkov_group/components/action_button.dart';

// обычные диалоги
class CustomDialog extends StatefulWidget {
  final String imagePath;
  final bool withImage; //если есть картинка в диалоге  по дефолту false
  final String title; // титул сообщения
  final String message; //сообщение диалога
  final bool withButton; // если есть кнопка по дефолту false
  final bool with2Buttons; // ксли две кнопки по дефолту false
  final ActionButton actionButton; // передаем нашу кастомную кнопку
  final ActionButton secondActionButton; // на тот случай если есть две кнопки

  const CustomDialog({
    Key key,
    this.imagePath,
    this.withImage = false,
    this.title,
    this.message,
    this.withButton = false,
    this.actionButton,
    this.with2Buttons = false,
    this.secondActionButton,
  }) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Center(
        child: Column(
          children: [
            widget.withImage ? Image.asset(widget.imagePath) : Container(),
            Text(widget.title),
            Text(widget.message),
            widget.withButton
                ? Container(
                    width: 304,
                    height: 36,
                    child: widget.actionButton,
                  )
                : Container(),
            widget.with2Buttons
                ? Container(
                    width: 304,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 36,
                          child: widget.actionButton,
                        ),
                        Container(
                          height: 36,
                          child: widget.secondActionButton,
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
