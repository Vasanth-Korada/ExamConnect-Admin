import 'package:dartz/dartz.dart';
import 'package:oepadmin/common/utils/constants.dart';
import 'package:oepadmin/common/utils/network/network_info.dart';
import 'package:oepadmin/core/models/failure.dart';
import 'package:oepadmin/data/data_source/auth_remote_data_source.dart';
import 'package:oepadmin/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this.networkInfo, this._authRemoteDataSource);

  @override
  Future<Either<Failure, bool>> onAdminLogin(
      String userName, String password) async {
    if (!await networkInfo.isConnected) {
      return Left(Failure(
          message: Constants.NO_INTERNET, failureType: FailureType.INTERNET));
    } else {
      try {
        var isValidLogin =
            await _authRemoteDataSource.onAdminLogin(userName, password);
        return Right(isValidLogin);
      } catch (e) {
        return Left(Failure(message: "Something went wrong!"));
      }
    }
  }

  @override
  Future<bool> onLogout() async {
    try {
      var isLoggedOut = await _authRemoteDataSource.onLogout();
      return Future.value(isLoggedOut);
    } catch (e) {
      return Future.value(false);
    }
  }

  @override
  Future<bool> checkAutoLoginStatus() async {
    try {
      var isAutoLogin = await _authRemoteDataSource.checkAutoLoginStatus();
      return Future.value(isAutoLogin);
    } catch (e) {
      return Future.value(false);
    }
  }
}
