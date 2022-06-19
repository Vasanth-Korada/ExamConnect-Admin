import 'package:flutter/material.dart';

showAlertDialog(
    {required BuildContext context,
    required String alertTitle,
    required Widget body,
    required List<Widget> actions,
    bool? barrierDissmissible
    }) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(

    title: Text(alertTitle),
    content: body,
    actions: actions,
  );

  // show the dialog
  showDialog(
    barrierDismissible: barrierDissmissible ?? true,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
