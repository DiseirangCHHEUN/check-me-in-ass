import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/modules/login/repository/auth_repository.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (value) => Get.put(
      AuthRepository(),
    ),
  );

  runApp(
    GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFFFFD000),
          foregroundColor: Colors.white,
          titleTextStyle: GoogleFonts.anton(
            fontSize: 25,
            color: Colors.white,
          ),
          centerTitle: false,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "Check Me In - Web",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
