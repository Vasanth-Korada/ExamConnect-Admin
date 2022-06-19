import 'package:flutter/material.dart';

dynamic buildSnackbar(BuildContext context, String message,
    {bool isTop = false, int snackBarDuration = 4000}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(milliseconds: snackBarDuration),
  ));
}
