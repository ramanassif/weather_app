import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/features/date_of_the_day/views/home_screen.dart';
import 'package:weather_app/features/get_weather/views/weather_screen.dart';

class AppRoute {
  static Route? generateRoute(RouteSettings settings) {
    var data = settings.arguments as Map<String, dynamic>;
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case weatherScreen:
        return MaterialPageRoute(builder: (_) => WeatherScreen(data));
    }
    return null;
  }
}
