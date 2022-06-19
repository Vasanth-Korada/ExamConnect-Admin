import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oepadmin/common/theme/app_theme.dart';
import 'package:oepadmin/firebase_options.dart';
import 'package:oepadmin/presentation/screens/login_screen.dart';
import 'package:flutter/services.dart';
import 'package:oepadmin/routes/app_pages.dart';
import 'flavors.dart';
import 'injector.dart';
import 'package:get/get.dart';

void main() async {
  F.appFlavor = Flavor.DEMO;
  WidgetsFlutterBinding.ensureInitialized();
  await init(Flavor.DEMO);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());
  }, (Object error, StackTrace stack) async {
    // await FlutterCrashlytics().reportCrash(error, stackTrace, forceCrash: false);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Exam Connect Admin',
      debugShowCheckedModeBanner: false,
      theme: oepAppTheme,
      getPages: AppPages.pages,
      home: const LoginScreen(),
    );
  }
}
