import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideOption extends StatelessWidget {
  const SlideOption({super.key});

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
            Duration(milliseconds: 1000),
            () async {
              slideKey.currentState!.reset();
              slideKey.currentState!.reset();
              DocumentSnapshot snap2 = await FirebaseFirestore.instance
                  .collection('attendance')
                  .doc(Timestamp.now().toString())
                  .get();
              try {
                String checkIn = snap2['checkin'];
                await FirebaseFirestore.instance.collection('attendance').add({
                  'checkin': 5,
                  'checkout': 5,
                  'id': 7,
                  'late': 5,
                  'name': 5,
                });
              } catch (e) {}
            },
          );
        },
      );
    });
  }
}
