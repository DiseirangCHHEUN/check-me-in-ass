import 'package:check_me_in/app/modules/home/utils/body_status.dart';
import 'package:check_me_in/app/modules/home/utils/date_display.dart';
import 'package:check_me_in/app/modules/home/utils/slide_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../auth/auth_repository/auth_repository.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset('assets/app_icons/40.png'),
            ),
            Text(
              ' Check Me In',
              style: GoogleFonts.anton(),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              AuthRepository.instance.signOut();
            },
            icon: Row(
              children: [
                Text(
                  'Logout ',
                  style: GoogleFonts.anton(color: Colors.white),
                ),
                const Icon(Icons.logout_rounded),
              ],
            ),
          ),
        ],
      ),
      body: GetBuilder(
          init: HomeController(),
          builder: (_) {
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/app_icons/152.png'),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Check Me In - Mobile',
                      style: GoogleFonts.anton(fontSize: 22),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                BodyStatus(),
                const SizedBox(
                  height: 20,
                ),
                const DateDisplay(),
                const SizedBox(
                  height: 20,
                ),
                SlideOption(),
              ],
            );
          }),
    );
  }
}
