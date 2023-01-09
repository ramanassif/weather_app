import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TempValue extends StatelessWidget {
  final String temp;
  final double fontSizeWidth;
  const TempValue({Key? key,required this.temp, required this.fontSizeWidth,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${((double.parse(temp) - 273.15).round()).toString()}\u2103',
      style: GoogleFonts.abel(
        color: Colors.white,
        fontSize: MediaQuery.of(context).size.width * fontSizeWidth,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
