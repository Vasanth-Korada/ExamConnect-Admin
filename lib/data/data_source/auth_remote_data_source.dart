import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_storage/get_storage.dart';

class AuthRemoteDataSource {
  GetStorage? storage;
  final remoteConfig = FirebaseRemoteConfig.instance;

  AuthRemoteDataSource(this.storage);

  Future<bool> checkAutoLoginStatus() {
    if (storage?.read("isLoggedIn") != null) {
      if (storage?.read("isLoggedIn") == true) {
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } else {
      return Future.value(false);
    }
  }

  Future<bool> onAdminLogin(String userName, String password) {
    if (storage?.read("isLoggedIn") != null) {
      return Future.value(storage?.read("isLoggedIn"));
    } else {
      if (userName == "admin" && password == remoteConfig.getString("admin")) {
        storage?.write("isLoggedIn", true);
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    }
  }

  Future<bool> onLogout() {
    try {
      storage?.remove("isLoggedIn");
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }
}
