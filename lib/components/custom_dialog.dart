import 'package:flutter/material.dart';
import 'package:kulenkov_group/components/dialogs/default_dialog_content.dart';
import 'package:kulenkov_group/components/dialogs/dialog_content_with_list.dart';
import 'package:kulenkov_group/constants/colors.dart';

import 'alert_dialog_close_button.dart';

class CustomDialog extends StatefulWidget {
  final bool withList; // true if use with List for shop details by default false
  final DefaultDialogContent defaultDialogContent;
  final DialogContentWithList dialogContentWithList;

  const CustomDialog({
    Key key,
    this.withList = false,
    this.dialogContentWithList,
    this.defaultDialogContent,
  }) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    // color transparent to show overlay button
    return AlertDialog(
      contentPadding: EdgeInsets.only(bottom: 30),
      backgroundColor: Colors.transparent,
      content: Column(
        children: [
          Container(
            // color white
            padding: EdgeInsets.only(top: 30, bottom: 20, left: 12, right: 12),
            decoration: BoxDecoration(
              borderRadius: (BorderRadius.circular(6)),
              color: Color(white),
            ),
            child: widget.withList
                ? widget.dialogContentWithList
                : widget.defaultDialogContent,

          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: AlertDialogCloseButton(),
          ),
        ],
      ),
    );
  }
}
