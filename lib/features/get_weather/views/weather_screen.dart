import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/get_weather/bloc/weather_bloc.dart';
import 'package:weather_app/features/get_weather/repositories/weather_service.dart';
import 'package:weather_app/features/get_weather/views/widgets/weather_screen_body.dart';

class WeatherScreen extends StatefulWidget {
  final Map<String, dynamic> mapArguments;

  const WeatherScreen(this.mapArguments, {Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc()
        ..add(GetWeather(
            weatherServices: WeatherServices(),
            dt: widget.mapArguments['data_time']!)),
      child: Builder(builder: (context) {
        return const SafeArea(
          child: Scaffold(
            body: WeatherScreenBody(),
          ),
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
