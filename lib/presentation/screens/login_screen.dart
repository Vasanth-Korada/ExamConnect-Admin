import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oepadmin/common/theme/color_theme.dart';
import 'package:oepadmin/common/utils/utils.dart';
import 'package:oepadmin/common/widgets/custom_text_field.dart';
import 'package:oepadmin/common/widgets/raised-button.dart';
import 'package:oepadmin/presentation/controllers/login_controller.dart';

class LoginScreen extends GetView {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loginController = Get.put(LoginController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png").paddingOnly(bottom: 32),
            CustomTextField(
              controller: loginController.userNameTxtFieldCtrl,
              onChanged: (val) {},
              validator: (String? val) {
                if (val!.isEmpty) {
                  return 'Username is required'.tr;
                }
                return null;
              },
              label: "Username",
              hintText: "Enter your username",
            ).paddingSymmetric(horizontal: 16),
            Obx(() =>
                CustomTextField(
                  controller: loginController.pwdTxtFieldCtrl,
                  onChanged: (val) {},
                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return 'Password is required'.tr;
                    }
                    return null;
                  },
                  label: "Password",
                  hintText: "Enter your password",
                  obscure: loginController.isObscureEnabled.value,
                  suffix: IconButton(
                    icon: loginController.isObscureEnabled.value
                        ? const Icon(
                      Icons.visibility_off,
                      color: AppColors.secondaryGrey,
                    )
                        : const Icon(
                      Icons.visibility,
                      color: AppColors.secondaryGrey,
                    ),
                    onPressed: () {
                      loginController.isObscureEnabled.value =
                      !loginController.isObscureEnabled.value;
                    },
                  ),
                )).paddingSymmetric(vertical: 6, horizontal: 16),
            CustomRaisedButton(
                width: TCUtils().getScreenWidth() - 40,
                onPressed: () {
                  TCUtils().hideKeyBoard(Get.context!);
                  loginController.onAdminLogin();
                },
                buttonText: "Login")
                .paddingOnly(top: 6)
          ],
        ),
      ),
    );
  }
}
