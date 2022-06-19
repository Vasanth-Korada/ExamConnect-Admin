import 'package:dartz/dartz.dart';
import 'package:oepadmin/core/models/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> onAdminLogin(String userName, String password);

  Future<bool> checkAutoLoginStatus();

  Future<bool> onLogout();
}
