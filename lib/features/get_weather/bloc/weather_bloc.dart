import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/get_weather/models/weather_model.dart';
import 'package:weather_app/features/get_weather/repositories/weather_service.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is GetWeather) {
      yield WeatherLoading();
      try {
        var weatherModel = await event.weatherServices.getWeather();
        yield (WeatherSuccess(weatherModel: weatherModel));
      } on Exception catch (e) {
        print(e);
        yield (WeatherFailure());
      }
    }
  }
}
