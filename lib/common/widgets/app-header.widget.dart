import 'package:flutter/material.dart';
import 'package:oepadmin/common/theme/color_theme.dart';
import 'package:oepadmin/common/utils/app-text-styles.dart';
import 'package:oepadmin/common/utils/utils.dart';
import 'package:get/get.dart';

class AppHeader extends StatelessWidget {
  final String title;

  const AppHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.bgColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Wrap(
              children: [
                Text(
                  title,
                  style: AppTextStyles.HEADER_TEXT_STYLE.copyWith(fontSize: 24),
                ),
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 12),
            Image.asset(
              "assets/images/logo.png",
              height: 100,
              width: 120,
            ).paddingSymmetric(horizontal: 16, vertical: 12),
          ],
        ));
  }
}
