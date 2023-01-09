import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CityName extends StatelessWidget {
  final String city;
  final double heightValue;

  const CityName({
    Key? key,
    required this.city,
    required this.heightValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      city,
      style: GoogleFonts.abel(
        color: Colors.white,
        fontSize: MediaQuery.of(context).size.height / heightValue,
      ),
    );
  }
}
