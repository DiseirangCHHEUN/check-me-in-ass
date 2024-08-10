import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
                  DateTime.now().day.toString(),
                  style: GoogleFonts.anton(color: Colors.red, fontSize: 25),
                ),
                Text(
                  DateFormat(' MMMM yyyy').format(DateTime.now()),
                  style: GoogleFonts.gabarito(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      DateFormat('hh:mm:ss a').format(DateTime.now()),
                      style:
                          GoogleFonts.anton(color: Colors.grey, fontSize: 35),
                    ));
              }),
        ],
      ),
    );
  }
}
