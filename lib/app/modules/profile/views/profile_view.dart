import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/app_icons/100.png'),
                ),
                const SizedBox(height: 16),
                Text(
                  'Diseirang CHHEUN',
                  style: GoogleFonts.anton(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.work_rounded,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Flutter Developer',
                      style: GoogleFonts.anton(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.card_membership,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'ID : 0001',
                      style: GoogleFonts.anton(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFFBDFFBF),
                          ),
                          child: const Column(
                            children: [
                              Text(
                                '10',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF003A1E),
                                ),
                              ),
                              Text(
                                'DAYS',
                                style: TextStyle(
                                  color: Color(0xFF003A1E),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            const Text('Available Leaves'),
                            FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF0011FF),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: 1,
                                    color: Color(0xFF0011FF),
                                  ),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                '   Apply   ',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Check In/Out History  ',
                  style: GoogleFonts.anton(
                    fontSize: 20,
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 100,
              itemBuilder: (context, index) => Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        DateTime.now().toString(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
