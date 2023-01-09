import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateCardItem extends StatelessWidget {
  final String dayName;
  final String date;
  final String monthName;

  const DateCardItem({
    Key? key,
    required this.dayName,
    required this.date,
    required this.monthName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          dayName,
          style: GoogleFonts.abel(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          date,
          style: GoogleFonts.abel(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          monthName,
          style: GoogleFonts.abel(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
