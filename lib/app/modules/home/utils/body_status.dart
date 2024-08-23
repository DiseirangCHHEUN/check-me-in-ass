import 'package:check_me_in/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyStatus extends GetView<HomeController> {
  const BodyStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            color: Colors.grey,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (_) {
            return Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Check In',
                        style: GoogleFonts.abel(
                            fontSize: 30,
                            color: Colors.green,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        controller.checkIn,
                        style: GoogleFonts.tomorrow(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Check Out',
                        style: GoogleFonts.abel(
                            fontSize: 30,
                            color: Colors.red,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        controller.checkOut,
                        style: GoogleFonts.tomorrow(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
