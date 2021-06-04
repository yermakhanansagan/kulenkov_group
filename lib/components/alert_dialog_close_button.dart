import 'package:flutter/material.dart';
import 'package:kulenkov_group/constants/colors.dart';


// кнопка закрыть в диалогах
class AlertDialogCloseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: FloatingActionButton(
        backgroundColor: Color(white),
        child: Icon(
          Icons.close,
          color: Color(0xFF828282),
          size: 20,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
