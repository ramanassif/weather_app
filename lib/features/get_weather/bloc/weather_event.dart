part of 'weather_bloc.dart';

abstract class WeatherEvent {}

class GetWeather extends WeatherEvent {
  final WeatherServices weatherServices;
  final DateTime dt;

  GetWeather({required this.weatherServices,required this.dt});
}
