import 'package:flutter/material.dart';
import 'package:kulenkov_group/constants/colors.dart';

class OutlinedActionButton extends StatelessWidget {
  final String title;
  final double borderSize;

  const OutlinedActionButton({Key key, this.title, this.borderSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox.expand(
      child: OutlinedButton(
        onPressed: () {},
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(red), fontSize: 14, fontWeight: FontWeight.w500),
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0),),
          side: BorderSide(color: Color(red), width: borderSize),
        ),
      ),
    );
  }
}
