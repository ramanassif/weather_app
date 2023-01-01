import 'package:weather_app/core/api_services/api_services.dart';
import 'package:weather_app/core/api_services/url.dart';
import 'package:weather_app/features/get_weather/models/weather_model.dart';

class WeatherServices {
  Future<ListDaysWeather> getWeather() async {
    Map<String, dynamic> data =
        await ApiServices(baseUrl: weatherUrl).getFromApi();

    ListDaysWeather listDaysWeather = ListDaysWeather.fromJson(data);
    return listDaysWeather;
  }
}
