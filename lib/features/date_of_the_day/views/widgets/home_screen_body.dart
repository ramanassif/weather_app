import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/date_of_the_day/views/widgets/date_card_item.dart';
import 'package:weather_app/features/date_of_the_day/views/widgets/landscape_orientation_content_homeScreen.dart';
import 'package:weather_app/features/date_of_the_day/views/widgets/portrait_orientation_content_homeScreen.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
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
      dates.add(
        DateCardItem(
          dayName: _dayNameFormatter.format(date),
          date: _dayFormatter.format(date),
          monthName: _monthFormatter.format(date),
        ),
      );
    }

    var orientationScreen = MediaQuery.of(context).orientation;

    return orientationScreen == Orientation.portrait
        ? PortraitOrientationContentHomeScreen(
            firstDay: firstDay!,
            secondDay: secondDay!,
            thirdDay: thirdDay!,
            dates: dates,
          )
        : LandScapeOrientationContentHomeScreen(
            firstDay: firstDay!,
            secondDay: secondDay!,
            thirdDay: thirdDay!,
            dates: dates,
          );
  }
}
