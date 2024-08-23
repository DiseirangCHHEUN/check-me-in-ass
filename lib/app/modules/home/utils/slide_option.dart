import 'dart:async';
// <<<<<<< main

import 'package:check_me_in/app/modules/home/controllers/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// =======
// import 'package:check_me_in/app/modules/home/controllers/home_controller.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// >>>>>>> master
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideOption extends GetView<HomeController> {
// <<<<<<< main
  const SlideOption({super.key});

// =======
//   SlideOption({super.key});
// >>>>>>> master
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
// <<<<<<< main
          DocumentSnapshot snap2 = await FirebaseFirestore.instance
              .collection('attendance')
              .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
              .get();
          try {
            String checkIn = snap2[0]['checkIn'];
            await FirebaseFirestore.instance
                .collection('attendance')
                .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
                .update({
              'checkIn': checkIn,
              'checkOut': DateFormat('hh:mm').format(DateTime.now())
            });
          } catch (e) {
            await FirebaseFirestore.instance
                .collection('attendance')
                .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
                .set({
              'checkIn': DateFormat('hh:mm').format(DateTime.now()),
            });
          }

          // Timer(
          //   Duration(milliseconds: 1000),
          //   () async {
          //     slideKey.currentState!.reset();
          //     // QuerySnapshot snap = await FirebaseFirestore.instance.collection('employee').where('id':)
          //     DocumentSnapshot snap2 = await FirebaseFirestore.instance
          //         .collection('TEST')
          //         .doc(controller.getHour())
          //         .get();
          //     try {
          //       String checkIn = snap2[0]['checkIn'];
          //       await FirebaseFirestore.instance
          //           .collection('TEST')
          //           .doc(controller.getHour())
          //           .update(
          //               {'checkIn': checkIn, 'checkOut': controller.getHour()});
          //     } catch (e) {
          //       await FirebaseFirestore.instance
          //           .collection('TEST')
          //           .doc(controller.getHour())
          //           .set({'checkIn': controller.getHour()});
          //     }

          //     // try {
          //     //   String checkIn = snap2['checkin'];
          //     //   await FirebaseFirestore.instance.collection('attendance').add(
          //     //     {
          //     //       'checkin': checkIn,
          //     //       'checkout': 5,
          //     //       'id': 7,
          //     //       'late': 5,
          //     //       'name': 5,
          //     //     },
          //     //   );
          //     // } catch (e) {}
          //   },
          // );
// =======
//           Timer(
//             const Duration(seconds: 1),
//             () async {
//               slideKey.currentState!.reset();

//               // QuerySnapshot snap = await FirebaseFirestore.instance.collection("Employee").where('id', isEqualTo: User)
//               DocumentSnapshot snap2 = await FirebaseFirestore.instance
//                   .collection('attendance')
//                   .doc(
//                     DateFormat('dd MMMM yyyy').format(DateTime.now()),
//                   )
//                   .get();
//               try {
//                 controller.checkOut = DateFormat(' hh:mm a').format(
//                   DateTime.now(),
//                 );
//                 print(controller.checkOut);
//                 String checkIn = snap2['checkIn'];
//                 await FirebaseFirestore.instance
//                     .collection('attendance')
//                     .doc(
//                       DateFormat('dd MMMM yyyy').format(DateTime.now()),
//                     )
//                     .update({
//                   'checkIn': checkIn,
//                   'checkOut': DateFormat(' hh:mm a').format(
//                     DateTime.now(),
//                   ),
//                 });
//               } catch (e) {
//                 controller.checkIn = DateFormat(' hh:mm a').format(
//                   DateTime.now(),
//                 );
//                 print(controller.checkIn);
//                 await FirebaseFirestore.instance
//                     .collection('attendance')
//                     .doc(
//                       DateFormat('dd MMMM yyyy').format(DateTime.now()),
//                     )
//                     .set({
//                   'checkIn': DateFormat(' hh:mm a').format(
//                     DateTime.now(),
//                   ),
//                 });
//               }
//             },
//           );
// >>>>>>> master
        },
      );
    });
  }
}
