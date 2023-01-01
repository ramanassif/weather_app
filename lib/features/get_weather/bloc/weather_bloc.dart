import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/get_weather/models/weather_model.dart';
import 'package:weather_app/features/get_weather/repositories/weather_service.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    DateTime? dateTime;
    var formattedDate = DateFormat('dd-MM-yyyy');
    String forDate;
    if (event is GetWeather) {
      yield WeatherLoading();
      try {
        dateTime = event.dt;
        forDate = formattedDate.format(dateTime);
        ListDaysWeather listDaysWeather =
            await event.weatherServices.getWeather();
        var listModel = listDaysWeather.list
            .where((element) =>
                (formattedDate.format(DateTime.parse(element.dateTime))) ==
                forDate)
            .toList();
        print(listModel);
        var weatherModel = listModel.firstWhere((element) =>
            ((dateTime!).isAtSameMomentAs((DateTime.parse(element.dateTime)))) ||
            ((dateTime).isAfter((DateTime.parse(element.dateTime)))));
        yield (WeatherSuccess(weatherModel: weatherModel));
      } on Exception catch (e) {
        print(e);
        yield (WeatherFailure());
      }
    }
  }
}
