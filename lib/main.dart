import 'package:flutter/material.dart';
import 'package:weather_app/features/date_of_the_day/views/home_page.dart';
import 'package:weather_app/features/get_weather/views/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        WeatherScreen.routeName: (context) => const WeatherScreen(),
      },
    );
  }
}
