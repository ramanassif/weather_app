import 'package:flutter/material.dart';
import 'package:weather_app/features/get_weather/models/weather_model.dart';
import 'package:weather_app/features/get_weather/views/widgets/city_name.dart';
import 'package:weather_app/features/get_weather/views/widgets/other_features_container.dart';
import 'package:weather_app/features/get_weather/views/widgets/shadow_image.dart';
import 'package:weather_app/features/get_weather/views/widgets/temp_value.dart';
import 'package:weather_app/features/get_weather/views/widgets/weather_image.dart';
import 'package:weather_app/features/get_weather/views/widgets/weather_status.dart';

class LandscapeOrientationContentWeatherScreen extends StatelessWidget {
  final WeatherModel weatherModel;

  const LandscapeOrientationContentWeatherScreen({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        direction: Axis.horizontal,
        children: [
          Flexible(
              flex: 30,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WeatherStatus(
                        weather: weatherModel.weather, heightValue: 8),
                    TempValue(temp: weatherModel.temp, fontSizeWidth: 0.10),
                    const Spacer(),
                    const CityName(city: 'Dubai', heightValue: 10),
                  ],
                ),
              )),
          Flexible(
            flex: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WeatherImage(
                    weatherStatus: weatherModel.weather, heightValue: 0.4),
                const ShadowImage(heightValue: 0.3),
              ],
            ),
          ),
          Flexible(
            flex: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                OtherFeatures(
                  widthValue: 0.2,
                  heightValue: 3,
                  title: 'Wind:',
                  value: '${weatherModel.windSpeed}Km/h',
                ),
                OtherFeatures(
                  widthValue: 0.2,
                  heightValue: 3,
                  title: 'humidity:',
                  value: '${weatherModel.humidity}%',
                ),
              ],
            ),
          ),
        ],
      ),

      //
      // Stack(
      //   clipBehavior: Clip.none,
      //   children: [
      //     BackgroundColor(weatherStatus: weatherModel.weather),
      //     Padding(
      //       padding: const EdgeInsets.only(
      //           left: 8.0, top: 24.0, bottom: 24.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.end,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               WeatherStatus(
      //                   weather: weatherModel.weather,
      //                   heightValue: 6),
      //               TempValue(
      //                   temp: weatherModel.temp,
      //                   fontSizeWidth: 0.10),
      //               SizedBox(
      //                 height:
      //                 MediaQuery.of(context).size.height / 4,
      //               ),
      //               const CityName(city: 'Dubai', heightValue: 10),
      //             ],
      //           ),
      //           Expanded(
      //             child: Column(
      //               mainAxisAlignment:
      //               MainAxisAlignment.spaceAround,
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 WeatherImage(
      //                     weatherStatus: weatherModel.weather,
      //                     heightValue: 0.4),
      //                 const ShadowImage(heightValue: 0.3),
      //               ],
      //             ),
      //           ),
      //           Column(
      //             mainAxisAlignment: MainAxisAlignment.spaceAround,
      //             crossAxisAlignment: CrossAxisAlignment.end,
      //             children: [
      //               OtherFeatures(
      //                 widthValue: 0.2,
      //                 heightValue: 3,
      //                 title: 'Wind:',
      //                 value: '${weatherModel.windSpeed}Km/h',
      //               ),
      //               OtherFeatures(
      //                 widthValue: 0.2,
      //                 heightValue: 3,
      //                 title: 'humidity:',
      //                 value: '${weatherModel.humidity}%',
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
