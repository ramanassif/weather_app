import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/date_of_the_day/views/widgets/date_card_item.dart';
import 'package:weather_app/features/get_weather/models/weather_model.dart';

WeatherModel firstWeather(
    {required DateTime dateTime,
    required List<WeatherModel> weatherModelList}) {
  return weatherModelList.firstWhere(
    (element) {
      DateTime thisDate = DateTime.parse(element.dateTime);
      DateTime thisDateAfter3Hours = thisDate.add(const Duration(hours: 3));
      if ((dateTime.compareTo(thisDate) == 1) &&
          (dateTime.compareTo(thisDateAfter3Hours) == -1)) {
        return true;
      } else {
        return false;
      }
    },
    orElse: () => weatherModelList.first,
  );
}