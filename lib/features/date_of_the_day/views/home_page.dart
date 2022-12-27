import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/get_weather/views/weather_screen.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _currentDate = DateTime.now();
  final _dayFormatter = DateFormat('d');
  final _dayNameFormatter = DateFormat('EEEE');
  final _monthFormatter = DateFormat('MMM');

  @override
  Widget build(BuildContext context) {
    final dates = <Widget>[];

    for (int i = 0; i < 3; i++) {
      final date = _currentDate.add(Duration(days: i));
      dates.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _dayNameFormatter.format(date),
              style: GoogleFonts.abel(
                color: Colors.white,
                fontSize: 28,
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
                fontSize: 40,
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
      body: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/city_background.jpg',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.low,
              )),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, WeatherScreen.routeName);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(child: dates[0]),
                      ),
                    ),
                    Positioned(
                      top: -10,
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'Today',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, WeatherScreen.routeName);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(child: dates[1]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, WeatherScreen.routeName);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(child: dates[2]),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
