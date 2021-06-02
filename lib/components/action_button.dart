import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kulenkov_group/constants/colors.dart';

class ActionButton extends StatelessWidget {
  final String labelText; // label text
  final bool isGradient; //
  final bool isOutlined; //
  final int color; //
  final int gradientColor1;
  final int gradientColor2;
  final double borderSize;
  final Function onPressed;

  const ActionButton(
      {Key key,
      this.labelText,
      this.isGradient = false,
      this.isOutlined = false,
      this.color,
      this.gradientColor1,
      this.gradientColor2,
      this.borderSize = 1,
      this.onPressed})
      : super(key: key); //

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox.expand(
      child: isOutlined
          ? OutlinedButton(
            onPressed: () {},
            child: Text(
              labelText,
              style: TextStyle(
                color: Color(color),
              ),
            ),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),

              ),side: BorderSide(color: Color(color), width: borderSize),
            ),
          )
          : ElevatedButton(
              onPressed: () {},
              child: isGradient
                  ? Material(
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(gradientColor1),
                              Color(gradientColor2)
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            labelText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(white),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )
                  : Text(
                      labelText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(white),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
              style: ElevatedButton.styleFrom(
                primary: isGradient ? Colors.transparent : Color(color),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0)),
                padding: const EdgeInsets.all(0.0),
              ),
            ),
    );
  }
}
