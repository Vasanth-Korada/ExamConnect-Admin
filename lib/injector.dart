import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oepadmin/common/config/app_config.dart';
import 'package:oepadmin/common/config/config_demo.dart';
import 'package:oepadmin/common/config/config_prod.dart';
import 'package:oepadmin/common/utils/network/network_info.dart';
import 'package:oepadmin/data/data_source/auth_remote_data_source.dart';
import 'package:oepadmin/data/repositories/auth_repository_impl.dart';
import 'package:oepadmin/domain/repositories/auth_repository.dart';
import 'flavors.dart';
import 'presentation/controllers/login_controller.dart';

var dio = Dio();
var getIt = GetIt.I;

Future<void> init(Flavor flavor) async {
  dio.interceptors.add(dioLoggerInterceptor);
  await GetStorage.init();
  getIt.registerLazySingleton<GetStorage>(() => GetStorage());

  getIt.registerSingleton<AppConfig>(
      (flavor == Flavor.DEMO) ? ConfigDemo() : ConfigProd());

  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  //Controllers
  getIt.registerLazySingleton<LoginController>(() => LoginController());

  //Auth Related
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(getIt()));
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt(), getIt()));
}
