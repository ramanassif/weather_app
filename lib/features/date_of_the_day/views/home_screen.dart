import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/date_of_the_day/views/widgets/home_screen_body.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _currentDate = DateTime.now();
  final _dayFormatter = DateFormat('d');
  final _dayNameFormatter = DateFormat('EEEE');
  final _monthFormatter = DateFormat('MMM');

  DateTime? firstDay;
  DateTime? secondDay;
  DateTime? thirdDay;

  @override
  Widget build(BuildContext context) {
    final dates = <Widget>[];

    for (int i = 0; i < 3; i++) {
      final date = _currentDate.add(Duration(days: i));
      if (i == 0) {
        firstDay = date;
      } else if (i == 1) {
        secondDay = date;
      } else if (i == 2) {
        thirdDay = date;
      }
      print('today: $firstDay');
      print('tomorrow: $secondDay');
      print('afterTomorrow: $thirdDay');
      dates.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _dayNameFormatter.format(date),
              style: GoogleFonts.abel(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              _dayFormatter.format(date),
              style: GoogleFonts.abel(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              _monthFormatter.format(date),
              style: GoogleFonts.abel(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Colors.black,
      ),
      body: Body(
        firstDay: firstDay!,
        secondDay: secondDay!,
        thirdDay: thirdDay!,
        dates: dates,
      ),
    );
  }
}
