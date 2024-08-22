import 'package:check_me_in/app/modules/home/controllers/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DateDisplay extends GetView<HomeController> {
  const DateDisplay({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    "${Timestamp.now().toDate().day}",
                    style: GoogleFonts.anton(color: Colors.red, fontSize: 25),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${Timestamp.now().toDate().month} ${Timestamp.now().toDate().year}',
                    style: GoogleFonts.gabarito(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  )
                ],
              )),
          StreamBuilder(
              stream: Stream.periodic(Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      controller.getHour(),
                      style:
                          GoogleFonts.anton(color: Colors.grey, fontSize: 35),
                    ));
              }),
        ],
      ),
    );
  }
}
