import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TCUtils {
  TCUtils._();

  static final TCUtils _instance = TCUtils._();

  factory TCUtils() {
    return _instance;
  }

  var currentFuelPrice = "0.0";
  var rupeeSymbol = "₹";

  /*used to hide key board*/
  void hideKeyBoard(BuildContext mContext) {
    FocusScope.of(mContext).requestFocus(FocusNode());
  }

  String getPRD() {
    return Platform.isAndroid ? "ANDR" : "IOS";
  }

  DateTime getCurrentDateTime() {
    return DateTime.now();
  }

  DateTime getOneMonthBackDateTime() {
    return DateTime.now().subtract(const Duration(days: 31));
  }

  String getFormatedDate(
      {required DateTime dateTime, required DateFormat dateFormat}) {
    final DateFormat formatter = dateFormat;
    final String formatted = formatter.format(dateTime);
    return formatted;
  }

  double getScreenWidth() {
    return Get.width;
  }

  double getScreenHeight() {
    return Get.height;
  }

  double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).viewPadding.top;
  }
}
