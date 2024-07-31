import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateDisplay extends StatelessWidget {
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
                    '11',
                    style: GoogleFonts.anton(color: Colors.red, fontSize: 25),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'July 2024',
                    style: GoogleFonts.gabarito(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  )
                ],
              )),
          Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '08:00:12',
                style: GoogleFonts.anton(color: Colors.grey, fontSize: 35),
              )),
        ],
      ),
    );
  }
}
