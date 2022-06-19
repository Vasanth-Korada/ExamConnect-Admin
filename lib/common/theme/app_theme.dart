import 'package:flutter/material.dart';
import 'package:oepadmin/common/theme/radii.dart';
import 'package:oepadmin/common/theme/text_theme.dart';

import 'color_theme.dart';
import 'font_family.dart';

final ThemeData oepAppTheme = ThemeData(
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  }),
  fontFamily: FontFamily.GOOGLE_SANS_REG,
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  primaryColor: AppColors.primaryColor,
  inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.primaryGrey,
      focusColor: AppColors.primaryGrey,
      prefixIconColor: AppColors.iconGrey,
      errorStyle: TextStyle(color: AppColors.errorRed),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.transparent)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.transparent))),
  buttonTheme: const ButtonThemeData(
      height: 51,
      shape: RoundedRectangleBorder(
        borderRadius: Radii.k16pxRadius,
      ),
      buttonColor: AppColors.primaryColor,
      textTheme: ButtonTextTheme.primary),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    primary: AppColors.primaryColor,

    textStyle: OMSTextStyles.buttonText,
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    // minimumSize: const Size(120, 51),
    shape: const RoundedRectangleBorder(borderRadius: Radii.k8pxRadius),
    // side: Borders.primaryBorder,
  )),

  dividerColor: AppColors.primaryGrey,
);
