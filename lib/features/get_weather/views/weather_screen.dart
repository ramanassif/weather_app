import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/get_weather/bloc/weather_bloc.dart';
import 'package:weather_app/features/get_weather/repositories/weather_service.dart';
import 'package:weather_app/features/get_weather/views/widgets/body.dart';

class WeatherScreen extends StatefulWidget {
  static String routeName = '/weather_screen';
  final DateTime dateTime;

  const WeatherScreen({Key? key,required this.dateTime}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WeatherBloc()..add(GetWeather(weatherServices: WeatherServices(),dt: widget.dateTime)),
      child: Builder(builder: (context) {
        return const Scaffold(
          body: Body(),
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
