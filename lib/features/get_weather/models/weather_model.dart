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

  static Map<String, dynamic> toMap(WeatherModel weatherModel) => {
        'weather': weatherModel.weather,
        'temp': weatherModel.temp,
        'speed': weatherModel.windSpeed,
        'humidity': weatherModel.humidity,
        'dt_txt': weatherModel.dateTime,
        'dt': weatherModel.dt,
      };

  static String encode(List<WeatherModel> weatherModelList) => json.encode(
        weatherModelList
            .map<Map<String, dynamic>>((music) => WeatherModel.toMap(music))
            .toList(),
      );

  static List<WeatherModel> decode(String weatherModelList) =>
      (json.decode(weatherModelList) as List<dynamic>)
          .map<WeatherModel>((item) => WeatherModel.fromJson(item))
          .toList();
}
