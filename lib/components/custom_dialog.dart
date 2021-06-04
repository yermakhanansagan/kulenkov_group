import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:kulenkov_group/components/action_button.dart';
import 'package:kulenkov_group/constants/colors.dart';

// обычные диалоги
class CustomDialog extends StatefulWidget {
  final String imagePath;
  final bool withImage; //если есть картинка в диалоге  по дефолту false
  final String title; // титул сообщения
  final bool withMessage;
  final String message;//сообщение диалога
  final bool withButton; // если есть кнопка по дефолту false
  final bool with2Buttons; // ксли две кнопки по дефолту false
  final ActionButton actionButton; // передаем нашу кастомную кнопку
  final ActionButton secondActionButton; // на тот случай если есть две кнопки

  const CustomDialog({
    Key key,
    this.imagePath,
    this.withImage = false,
    this.title,
    this.withMessage = false,
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
      backgroundColor: Colors.transparent,
      content: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: (BorderRadius.circular(6)),
              color: Color(white),
            ),
            padding: EdgeInsets.only(top: 30, bottom: 20, left: 12, right: 12),
            child: Center(
              child: Column(
                children: [
                  widget.withImage
                      ? Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Image.asset(widget.imagePath),
                      )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(widget.title),
                  ),
                  widget.withMessage ? Text(widget.message) : Container(),
                  widget.withButton
                      ? Container(
                    margin: EdgeInsets.only(top: 16),
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
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              width: 40,
              height: 40,
              child: FloatingActionButton(
                backgroundColor: Color(white),
                child: Icon(Icons.close, color: Color(0xFF828282), size: 20,),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
