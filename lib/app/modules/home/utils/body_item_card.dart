import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'body_item_button.dart';

class BodyItemCard extends StatelessWidget {
  const BodyItemCard({
    super.key,
    required this.itemTitle,
    required this.onCheckIn,
    required this.onCheckOut,
  });

  final String itemTitle;
  final Function()? onCheckIn, onCheckOut;

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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 30),
                width: double.infinity,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(5),
                //   // color: const Color(0xFFFFFAE5),
                // ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Wrap(
                      children: [
                        Row(
                          children: [
                            BodyItemButton(
                              bgColor: Colors.green,
                              fgColor: Colors.white,
                              title: ' Check In ',
                              onPressed: onCheckIn,
                            ),
                            BodyItemButton(
                              bgColor: Colors.redAccent,
                              fgColor: Colors.white,
                              title: ' Check Out ',
                              onPressed: onCheckOut,
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
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Text(
              itemTitle,
              style: GoogleFonts.anton(),
            ),
          ),
        ),
      ],
    );
  }
}
