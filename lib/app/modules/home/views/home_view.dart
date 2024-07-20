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
        actions: [
          IconButton(
              onPressed: () {
                AuthRepository.instance.signOut();
              },
              icon: const Icon(Icons.logout_rounded))
        ],
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
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            BodyItem(),
            BodyItem(),
            BodyItem(),
          ],
        ),
      ),
    );
  }
}

class BodyItem extends StatelessWidget {
  const BodyItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFFFF3C5),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Wrap(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: FilledButton.tonal(
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Check In',
                                  style: GoogleFonts.anton(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FilledButton.tonal(
                                style: FilledButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.redAccent,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Check Out',
                                  style: GoogleFonts.anton(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Text(
              '  Foods break!  ',
              style: GoogleFonts.anton(color: Colors.amber),
            ),
          ),
        ),
      ],
    );
  }
}
