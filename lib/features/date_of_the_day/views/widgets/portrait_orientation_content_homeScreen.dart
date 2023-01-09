import 'package:flutter/material.dart';
import 'package:weather_app/features/date_of_the_day/views/widgets/date_card.dart';

class PortraitOrientationContentHomeScreen extends StatelessWidget {
  final DateTime firstDay;
  final DateTime secondDay;
  final DateTime thirdDay;
  final List<Widget> dates;

  const PortraitOrientationContentHomeScreen({
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
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DateCard(
              widthValue: 1,
              heightValue: 2,
              dateTime: firstDay,
              child: dates[0],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DateCard(
                  widthValue: 2.5,
                  heightValue: 4,
                  dateTime: secondDay,
                  child: dates[1],
                ),
                DateCard(
                  widthValue: 2.5,
                  heightValue: 4,
                  dateTime: thirdDay,
                  child: dates[2],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
