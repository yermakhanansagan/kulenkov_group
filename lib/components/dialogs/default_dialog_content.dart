import 'package:flutter/material.dart';


import '../action_button.dart';

class DefaultDialogContent extends StatelessWidget {
  final String imagePath;
  final bool withImage; //если есть картинка в диалоге  по дефолту false
  final String title; // титул сообщения
  final bool withMessage;
  final String message; //сообщение диалога
  final bool withButton; // если есть кнопка по дефолту false
  final bool with2Buttons; // ксли две кнопки по дефолту false
  final ActionButton actionButton; // передаем нашу кастомную кнопку
  final ActionButton secondActionButton;

  const DefaultDialogContent(
      {Key key,
      this.imagePath,
      this.withImage = false,
      this.title,
      this.withMessage = false,
      this.message,
      this.withButton = false,
      this.with2Buttons = false,
      this.actionButton,
      this.secondActionButton})
      : super(key: key); // на тот случай если есть две кнопки
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // здесь и даллее если есть картинка то картинка если нет то пустой контейнер
        withImage
            ? Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Image.asset(imagePath),
              )
            : Container(),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(title),
        ),
        withMessage ? Text(message) : Container(),
        withButton
            ? Container(
                margin: EdgeInsets.only(top: 16),
                width: 304,
                height: 36,
                child: actionButton,
              )
            : Container(),
        with2Buttons
            ? Container(
                margin: EdgeInsets.only(top: 16),
                width: 304,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 36,
                      child: actionButton,
                    ),
                    Container(
                      height: 36,
                      child: secondActionButton,
                    ),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }
}
