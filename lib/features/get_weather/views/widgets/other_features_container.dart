import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherFeatures extends StatelessWidget {
  final String title;
  final String value;
  final double widthValue;
  final double heightValue;

  const OtherFeatures({
    Key? key,
    required this.title,
    required this.value,
    required this.widthValue,
    required this.heightValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * widthValue,
      height: MediaQuery.of(context).size.height / heightValue,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.lato(color: Colors.grey, fontSize: 20),
            ),
            Text(value,
                style: GoogleFonts.abel(color: Colors.black, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
