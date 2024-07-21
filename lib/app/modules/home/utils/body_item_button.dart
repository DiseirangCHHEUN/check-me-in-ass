import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyItemButton extends StatelessWidget {
  const BodyItemButton({
    super.key,
    required this.bgColor,
    required this.fgColor,
    required this.title,
    required this.onPressed,
  });

  final Color bgColor, fgColor;
  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FilledButton.tonal(
        style: FilledButton.styleFrom(
            backgroundColor: bgColor, foregroundColor: fgColor),
        onPressed: onPressed,
        child: Text(title, style: GoogleFonts.anton(fontSize: 18)),
      ),
    );
  }
}
