import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oepadmin/common/theme/color_theme.dart';
import 'package:oepadmin/common/utils/app-text-styles.dart';
import 'package:oepadmin/common/widgets/app-header.widget.dart';
import 'package:oepadmin/presentation/controllers/adminDashboardCtrl.dart';
import 'package:oepadmin/routes/routes.dart';

class AdminDashboardScreen extends GetView {
  const AdminDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var adminDashboardCtrl = Get.put(AdminDashboardCtrl());
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const AppHeader(title: "Admin\nDashboard"),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  AdminDashboardMenuItem(
                    title: "Schedule\nExam",
                    imgRes: "assets/images/schedule_exam.png",
                    onPressed: () {
                      Get.toNamed(Routes.CREATE_EXAM);
                    },
                  ),
                  AdminDashboardMenuItem(
                    title: "Reports",
                    imgRes: "assets/images/analytics.png",
                    onPressed: () {
                      Get.toNamed(Routes.REPORTS_SCREEN);
                    },
                  ),
                  AdminDashboardMenuItem(
                    title: "Logout",
                    imgRes: "assets/images/logout.png",
                    onPressed: () {
                      adminDashboardCtrl.onLogout();
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AdminDashboardMenuItem extends StatelessWidget {
  final String title;
  final String imgRes;
  final VoidCallback onPressed;

  const AdminDashboardMenuItem({Key? key,
    required this.title,
    required this.imgRes,
    required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                  colors: [Colors.indigo, Colors.indigoAccent])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.HEADER_TEXT_STYLE
                    .copyWith(fontSize: 26, color: AppColors.textWhite),
              ),
              Image.asset(
                imgRes,
                height: 45,
                width: 45,
              )
            ],
          ).paddingSymmetric(horizontal: 32, vertical: 12))
          .paddingSymmetric(horizontal: 16, vertical: 12),
    );
  }
}
