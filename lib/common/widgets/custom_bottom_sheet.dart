import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:oepadmin/common/theme/color_theme.dart';
import 'package:oepadmin/common/theme/radii.dart';

Future showCustomBottomSheet(
    {required Widget body,
    double? height,
    BuildContext? context,
    bool isDismissible = true}) {
  return Get.bottomSheet(
      Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context ?? Get.context!).viewInsets.bottom),
        child: Container(
          decoration: const BoxDecoration(
              color: AppColors.textWhite,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          height: height ?? 250,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 30,
                  height: 4,
                  decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: Radii.k16pxRadius),
                ).paddingAll(8),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(child: body),
            ],
          ),
        ),
      ),
      isDismissible: isDismissible,
      enableDrag: false);
}
