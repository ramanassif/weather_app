import 'package:flutter/material.dart';
import 'package:weather_app/features/date_of_the_day/views/widgets/date_card.dart';

class LandScapeOrientationContentHomeScreen extends StatelessWidget {
  final DateTime firstDay;
  final DateTime secondDay;
  final DateTime thirdDay;
  final List<Widget> dates;

  const LandScapeOrientationContentHomeScreen({
    Key? key,
    required this.firstDay,
    required this.secondDay,
    required this.thirdDay,
    required this.dates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/city_background.jpg'),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DateCard(
                heightValue: 2,
                widthValue: 4,
                dateTime: firstDay,
                child: dates[0],
              ),
              DateCard(
                heightValue: 2,
                widthValue: 4,
                dateTime: secondDay,
                child: dates[1],
              ),
              DateCard(
                heightValue: 2,
                widthValue: 4,
                dateTime: thirdDay,
                child: dates[2],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
