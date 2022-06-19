import 'package:flutter/material.dart';
import 'package:oepadmin/common/theme/color_theme.dart';
import 'package:oepadmin/common/theme/text_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String content;
  final AppBar appBar;
  final List<Widget>? actions;
  final bool? centerTitle;

  const CustomAppBar(
      {Key? key,
      required this.content,
      required this.appBar,
      this.actions,
      this.centerTitle = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        content,
        style: OMSTextStyles.appBarText,
      ),
      backgroundColor: AppColors.appBarColor,
      centerTitle: true,
      elevation: 0,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
