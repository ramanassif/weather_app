import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/helper.dart';
import 'package:weather_app/core/storage_services/storage_services.dart';
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
        var value =
            await StorageServices.read('weather_key${forDate.toString()}');
        print(value);
        if (value != null) {
          print(value);
          final List<WeatherModel> weatherModelList =
              WeatherModel.decode(value);
          var firstWeatherModel = firstWeather(
              dateTime: dateTime, weatherModelList: weatherModelList);
          yield (WeatherSuccess(weatherModel: firstWeatherModel));
        } else {
          ListDaysWeather listDaysWeather =
              await event.weatherServices.getWeather();
          var listModel = listDaysWeather.list
              .where((element) =>
                  (formattedDate.format(DateTime.parse(element.dateTime))) ==
                  forDate)
              .toList();
          print(listModel);
          var weatherModel =
              firstWeather(dateTime: dateTime, weatherModelList: listModel);
          final String encodedWeatherModel = WeatherModel.encode(listModel);
          print(encodedWeatherModel);
          StorageServices.write(
              'weather_key${forDate.toString()}', encodedWeatherModel);
          yield (WeatherSuccess(weatherModel: weatherModel));
        }
      } on Exception catch (e) {
        yield (WeatherFailure(
          errorMessage: e.toString(),
        ));
      }
    }
  }
}
