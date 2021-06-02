import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final int color1;
  final int color2;
  final int textColor;
  final Function onPressed;

  const ActionButton(
      {Key key,
      this.title,
      this.color1,
      this.color2,
      this.textColor,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: () {
        return onPressed;
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        padding: const EdgeInsets.all(0.0),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(color1), Color(color2)]),
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(textColor),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
