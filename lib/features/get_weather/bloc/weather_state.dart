part of 'weather_bloc.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  WeatherModel weatherModel;
  //ListDaysWeather listDaysWeather;
  WeatherSuccess({required this.weatherModel});
}

class WeatherFailure extends WeatherState {
  String errorMessage;
  WeatherFailure({required this.errorMessage});
}
