import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oepadmin/common/theme/color_theme.dart';

import '../theme/text_theme.dart';

class CustomButton extends GetView {
  final String btnText;
  final VoidCallback onPressed;
  final bool? showForwardArrow;
  final Color? color;

  const CustomButton(
      {Key? key,
      required this.btnText,
      required this.onPressed,
      this.color,
      this.showForwardArrow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(color ?? AppColors.primaryColor)),
          icon: showForwardArrow == true
              ? Image.asset(
                  "assets/icons/forward_arrow.png",
                  width: 28,
                  height: 10,
                )
              : Container(),
          onPressed: () => onPressed(),
          label: Text(
            btnText,
            style: OMSTextStyles.buttonText,
          )),
    );
  }
}
