import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherStatus extends StatelessWidget {
  final String weather;
  final double heightValue;

  const WeatherStatus({
    Key? key,
    required this.weather,
    required this.heightValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      weather.toString(),
      style: GoogleFonts.abel(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.height / heightValue),
    );
  }
}
