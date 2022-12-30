class WeatherModel {
  final String weather;
  final double temp;
  final double windSpeed;
  final int humidity;
  final String dateTime;
  final String dt;

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
      weather: data['list'][0]['weather'][0]['main'],
      temp: data['list'][0]['main']['temp'],
      windSpeed: data['list'][0]['wind']['speed'],
      humidity: data['list'][0]['main']['humidity'],
      dateTime: data['list'][0]['dt_txt'],
      dt: data['list'][0]['dt'],
    );
  }
}
