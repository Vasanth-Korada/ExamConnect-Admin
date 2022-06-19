import 'package:get/get.dart';
import 'package:oepadmin/common/widgets/custom_snackbar.dart';
import 'package:oepadmin/domain/repositories/auth_repository.dart';
import 'package:oepadmin/injector.dart';
import 'package:oepadmin/routes/routes.dart';

class AdminDashboardCtrl extends GetxController {
  var authRepo = getIt.get<AuthRepository>();

  Future<void> onLogout() async {
    var isLoggedOut = await authRepo.onLogout();

    if (isLoggedOut == true) {
      Get.offAllNamed(Routes.LOGIN_SCREEN);
    } else {
      buildSnackbar(Get.context!, "Logout Failed");
    }
  }
}
