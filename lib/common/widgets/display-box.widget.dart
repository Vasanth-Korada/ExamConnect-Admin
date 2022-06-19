import 'package:flutter/material.dart';
import 'package:oepadmin/common/widgets/text-widget.dart';

class DisplayBox extends StatelessWidget {
  String content;
  double? height;
  double? width;
  String? icon;
  bool? showIcon = false;

  DisplayBox(
      {Key? key,
      required this.content,
      this.height,
      this.width,
      this.icon,
      this.showIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.purple[200], borderRadius: BorderRadius.circular(12.0)),
      child: Center(
          child: showIcon!
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    icon != null
                        ? Image.asset(
                            icon!,
                            height: 25,
                            width: 25,
                          )
                        : Container(),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                        child: PrimaryTextWidget(
                      content: content,
                    )),
                  ],
                )
              : PrimaryTextWidget(content: content)),
    );
  }
}
