import 'dart:convert';

class ListDaysWeather {
  final List<WeatherModel> list;

  ListDaysWeather({required this.list});

  factory ListDaysWeather.fromJson(dynamic data) {
    List<WeatherModel> list = <WeatherModel>[];
    if (data['list'] != null) {
      for (var element in (data['list'] as List)) {
        list.add(WeatherModel.fromJson(element));
      }
    }
    return ListDaysWeather(list: list);
  }

  static Map<String, dynamic> toJson(ListDaysWeather listDaysWeather) => {
        "list": listDaysWeather.list,
      };
}

class WeatherModel {
  final String weather;
  final String temp;
  final String windSpeed;
  final int humidity;
  final String dateTime;
  final int dt;

  WeatherModel({
    required this.weather,
    required this.temp,
    required this.windSpeed,
    required this.humidity,
    required this.dateTime,
    required this.dt,
  });

  factory WeatherModel.fromJson(dynamic data) {
    return WeatherModel(
      weather: data['weather'][0]['main'],
      temp: data['main']['temp'].toString(),
      windSpeed: data['wind']['speed'].toString(),
      humidity: data['main']['humidity'],
      dateTime: data['dt_txt'],
      dt: data['dt'],
    );
  }

  static Map<String, dynamic> toJson(WeatherModel weatherModel) => {
        "dt": weatherModel.dt,
        "main": {
          "temp": weatherModel.temp,
          "humidity": weatherModel.humidity,
        },
        "weather": [
          {
            "main": weatherModel.weather,
          }
        ],
        "wind": {
          "speed": weatherModel.windSpeed,
        },
        "dt_txt": weatherModel.dateTime
      };

  static String encode(List<WeatherModel> weatherModelList) => json.encode(
        weatherModelList
            .map<Map<String, dynamic>>((item) => WeatherModel.toJson(item))
            .toList(),
      );

  static List<WeatherModel> decode(String weatherModelList) =>
      (json.decode(weatherModelList) as List<dynamic>)
          .map<WeatherModel>((item) => WeatherModel.fromJson(item))
          .toList();
}
