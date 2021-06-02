import 'package:flutter/material.dart';


class OutlinedActionButton extends StatelessWidget {
  final String title;
  final int textColor;
  final double borderSize;
  final Function onPressed;

  const OutlinedActionButton(
      {Key key, this.title, this.textColor, this.borderSize, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox.expand(
      child: OutlinedButton(
        onPressed: () {
          return onPressed;
        },
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(textColor),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          side: BorderSide(color: Color(textColor), width: borderSize),
        ),
      ),
    );
  }
}
