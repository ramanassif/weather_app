import 'package:flutter/material.dart';
import 'package:weather_app/features/get_weather/models/weather_model.dart';
import 'package:weather_app/features/get_weather/views/widgets/city_name.dart';
import 'package:weather_app/features/get_weather/views/widgets/other_features_container.dart';
import 'package:weather_app/features/get_weather/views/widgets/shadow_image.dart';
import 'package:weather_app/features/get_weather/views/widgets/temp_value.dart';
import 'package:weather_app/features/get_weather/views/widgets/weather_image.dart';
import 'package:weather_app/features/get_weather/views/widgets/weather_status.dart';

class PortraitOrientationContentWeatherScreen extends StatelessWidget {
  final WeatherModel weatherModel;

  const PortraitOrientationContentWeatherScreen(
      {Key? key, required this.weatherModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color:
            (weatherModel.weather == 'Clouds' || weatherModel.weather == 'Rain')
                ? Colors.blueAccent
                : weatherModel.weather == 'Clear'
                    ? Colors.orangeAccent
                    : Colors.greenAccent,
      ),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
            flex: 20,
            child: SizedBox(
              child: Column(
                children: [
                  WeatherStatus(weather: weatherModel.weather, heightValue: 10),
                  Text(weatherModel.dateTime),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 45,
            fit: FlexFit.loose,
            child: ListView(
              clipBehavior: Clip.none,
              children: [
                WeatherImage(
                    weatherStatus: weatherModel.weather, heightValue: 0.3),
                const ShadowImage(heightValue: 0.25),
              ],
            ),
          ),
          Flexible(
            flex: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: CityName(city: 'Dubai', heightValue: 12),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TempValue(
                            temp: weatherModel.temp, fontSizeWidth: 0.15),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      OtherFeatures(
                        widthValue: 0.25,
                        heightValue: 9,
                        title: 'Wind:',
                        value: '${weatherModel.windSpeed}Km/h',
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      OtherFeatures(
                        widthValue: 0.25,
                        heightValue: 9,
                        title: 'humidity:',
                        value: '${weatherModel.humidity}%',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
