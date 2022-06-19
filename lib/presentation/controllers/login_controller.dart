import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oepadmin/common/utils/constants.dart';
import 'package:oepadmin/common/widgets/custom_snackbar.dart';
import 'package:oepadmin/domain/repositories/auth_repository.dart';
import 'package:oepadmin/injector.dart';
import 'package:oepadmin/routes/routes.dart';

class LoginController extends GetxController {
  var isObscureEnabled = true.obs;
  final remoteConfig = FirebaseRemoteConfig.instance;
  final userNameTxtFieldCtrl = TextEditingController();
  final pwdTxtFieldCtrl = TextEditingController();
  var authRepo = getIt.get<AuthRepository>();

  @override
  void onInit() async {
    super.onInit();

    //config settings
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));

    //set default values
    await remoteConfig.setDefaults(const {
      "admin": "vktech",
    });

    //fetch and activate
    remoteConfig.fetchAndActivate();

    autoLoginUser();
  }

  void autoLoginUser() async {
    var isLoggedIn = await authRepo.checkAutoLoginStatus();
    if (isLoggedIn == true) {
      Get.offAllNamed(Routes.ADMIN_DASHBOARD);
    }
  }

  Future<void> onAdminLogin() async {
    String userName = userNameTxtFieldCtrl.text;
    String password = pwdTxtFieldCtrl.text;

    var response = await authRepo.onAdminLogin(userName, password);

    response.fold((l) {
      return buildSnackbar(
          Get.context!, l.message ?? Constants.SOMETHING_WENT_WRONG);
    }, (r) {
      if (r == true) {
        Get.offAllNamed(Routes.ADMIN_DASHBOARD);
      } else {
        return buildSnackbar(Get.context!, "Invalid Credentials");
      }
    });
  }


}
