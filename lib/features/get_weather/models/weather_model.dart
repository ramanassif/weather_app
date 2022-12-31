class ListDaysWeather {
  final List<WeatherModel> list;

  ListDaysWeather({required this.list});

  factory ListDaysWeather.fromJson(dynamic data) {
    List<WeatherModel> list = <WeatherModel>[];
    if (data['list'] != null) {
      (data['list'] as List).forEach((element) {
        list.add(WeatherModel.fromJson(element));
      });
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
}
