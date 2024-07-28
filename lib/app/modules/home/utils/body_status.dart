import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyStatus extends StatelessWidget {
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
      child: Row(
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
                  '9:22',
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
                  '9:48',
                  style: GoogleFonts.tomorrow(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
