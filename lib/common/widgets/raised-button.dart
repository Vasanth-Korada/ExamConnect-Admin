import 'package:flutter/material.dart';
import 'package:oepadmin/common/theme/color_theme.dart';
import 'package:oepadmin/common/widgets/text-widget.dart';

class CustomRaisedButton extends StatefulWidget {
  final double? height;
  final double width;
  final Function onPressed;
  final String buttonText;
  final Color? color;

  const CustomRaisedButton(
      {Key? key,
      this.height = 50,
      required this.width,
      required this.onPressed,
      required this.buttonText,
      this.color = AppColors.btnColor})
      : super(key: key);

  @override
  _CustomRaisedButtonState createState() => _CustomRaisedButtonState();
}

class _CustomRaisedButtonState extends State<CustomRaisedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              widget.color ?? AppColors.btnColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: const BorderSide(color: AppColors.primaryColor))),
        ),
        onPressed: () {
          widget.onPressed();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeaderTextWidget(
              content: widget.buttonText,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
