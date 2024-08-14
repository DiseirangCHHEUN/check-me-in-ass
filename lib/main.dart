import 'dart:async';
import 'package:check_me_in/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'app/modules/auth/auth_repository/auth_repository.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize firebase app
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (value) => Get.put(AuthRepository()),
  );

  // avoid/disable screen rotation
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  // remove splash provide by flutter
  FlutterNativeSplash.remove();

  runApp(
    GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFDCEFFF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFD147),
          foregroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: '/signin',
      getPages: AppPages.routes,
    ),
  );
}
