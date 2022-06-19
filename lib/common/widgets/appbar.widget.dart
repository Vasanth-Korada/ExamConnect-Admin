import 'package:flutter/material.dart';
import 'package:oepadmin/common/widgets/text-widget.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String content;
  final AppBar appBar;

  const GradientAppBar({
    required this.content,
    required this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: HeaderTextFancyWidget(
        content: content,
        fontSize: 18,
        color: Colors.white,
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF732BCA), Color(0xFF7A17CE)])),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
