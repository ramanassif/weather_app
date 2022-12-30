part of 'weather_bloc.dart';

abstract class WeatherEvent {}

class GetWeather extends WeatherEvent {
  final WeatherServices weatherServices;

  GetWeather({required this.weatherServices});
}
