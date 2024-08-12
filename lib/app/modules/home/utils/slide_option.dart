import 'dart:async';
import 'package:check_me_in/app/modules/home/controllers/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideOption extends GetView<HomeController> {
  SlideOption({super.key});
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final GlobalKey<SlideActionState> slideKey = GlobalKey();
      return SlideAction(
        innerColor: Colors.black,
        outerColor: Colors.yellow,
        key: slideKey,
        child: Text(
          'Slide to Check In',
          style: GoogleFonts.anton(fontSize: 25, color: Colors.black),
        ),
        onSubmit: () async {
          Timer(
            const Duration(seconds: 1),
            () async {
              slideKey.currentState!.reset();

              // QuerySnapshot snap = await FirebaseFirestore.instance.collection("Employee").where('id', isEqualTo: User)
              DocumentSnapshot snap2 = await FirebaseFirestore.instance
                  .collection('attendance')
                  .doc(
                    DateFormat('dd MMMM yyyy').format(DateTime.now()),
                  )
                  .get();
              try {
                controller.checkOut = DateFormat(' hh:mm a').format(
                  DateTime.now(),
                );
                print(controller.checkOut);
                String checkIn = snap2['checkIn'];
                await FirebaseFirestore.instance
                    .collection('attendance')
                    .doc(
                      DateFormat('dd MMMM yyyy').format(DateTime.now()),
                    )
                    .update({
                  'checkIn': checkIn,
                  'checkOut': DateFormat(' hh:mm a').format(
                    DateTime.now(),
                  ),
                });
              } catch (e) {
                controller.checkIn = DateFormat(' hh:mm a').format(
                  DateTime.now(),
                );
                print(controller.checkIn);
                await FirebaseFirestore.instance
                    .collection('attendance')
                    .doc(
                      DateFormat('dd MMMM yyyy').format(DateTime.now()),
                    )
                    .set({
                  'checkIn': DateFormat(' hh:mm a').format(
                    DateTime.now(),
                  ),
                });
              }
            },
          );
        },
      );
    });
  }
}
