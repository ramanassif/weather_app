import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/basics_widgets/error_message.dart';
import 'package:weather_app/core/basics_widgets/generic_loader.dart';
import 'package:weather_app/features/get_weather/bloc/weather_bloc.dart';
import 'package:weather_app/features/get_weather/models/weather_model.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  WeatherModel? weatherModel;
  ListDaysWeather? listDaysWeather;

  @override
  Widget build(BuildContext context) {
    var orientationScreen = MediaQuery.of(context).orientation;

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(
            child: GenericLoader(),
          );
        } else if (state is WeatherSuccess) {
          //listDaysWeather = state.listDaysWeather;
          //jsonEncode({"list":[1]})
          weatherModel = state.weatherModel;
          print(weatherModel!.dateTime);
          return orientationScreen == Orientation.portrait
              ? SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      backgroundContainer(weather: weatherModel!.weather),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, top: 24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      child: weatherStatus(
                                          weather: weatherModel!.weather,
                                          heightValue: 10),
                                    ),
                                    Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.15,
                                      left: MediaQuery.of(context).size.width *
                                          0.35,
                                      child: weatherImage(
                                          weatherStatus: weatherModel!.weather,
                                          heightValue: 0.3),
                                    ),
                                    Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.55,
                                      left: MediaQuery.of(context).size.width *
                                          0.35,
                                      child: shadowImage(heightValue: 0.2),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                cityName(city: 'Dubai', heightValue: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: tempValue(
                                          temp: weatherModel!.temp,
                                          fontSizeWidth: 0.15),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    windAndHumidityContainer(
                                      widthValue: 0.25,
                                      heightValue: 7,
                                      title: 'Wind:',
                                      value: '${weatherModel!.windSpeed}Km/h',
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    windAndHumidityContainer(
                                      widthValue: 0.25,
                                      heightValue: 7,
                                      title: 'humidity:',
                                      value: '${weatherModel!.humidity}%',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      backgroundContainer(weather: weatherModel!.weather),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 24.0, bottom: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                weatherStatus(
                                    weather: weatherModel!.weather,
                                    heightValue: 6),
                                tempValue(
                                    temp: weatherModel!.temp,
                                    fontSizeWidth: 0.10),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                ),
                                cityName(city: 'Dubai', heightValue: 10),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  weatherImage(
                                      weatherStatus: weatherModel!.weather,
                                      heightValue: 0.4),
                                  shadowImage(heightValue: 0.3),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                windAndHumidityContainer(
                                  widthValue: 0.2,
                                  heightValue: 3,
                                  title: 'Wind:',
                                  value: '${weatherModel!.windSpeed}Km/h',
                                ),
                                windAndHumidityContainer(
                                  widthValue: 0.2,
                                  heightValue: 3,
                                  title: 'humidity:',
                                  value: '${weatherModel!.humidity}%',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        } else if (state is WeatherFailure) {
          return const ErrorMessage(
            message: 'Something went wrong, Please try again',
          );
        } else {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                GenericLoader(),
              ],
            ),
          );
        }
      },
    );
  }

  Widget backgroundContainer({required String weather}) {
    return Container(
      color: weather == 'Clouds'
          ? Colors.blueAccent
          : weather == 'Clear'
              ? Colors.orangeAccent
              : Colors.greenAccent,
    );
  }

  Widget windAndHumidityContainer(
      {required String title,
      required String value,
      required double widthValue,
      required double heightValue}) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * widthValue,
      height: MediaQuery.of(context).size.height / heightValue,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.lato(color: Colors.grey, fontSize: 20),
            ),
            Text(value,
                style: GoogleFonts.abel(color: Colors.black, fontSize: 20)),
          ],
        ),
      ),
    );
  }

  Widget cityName({required String city, required double heightValue}) {
    return Text(
      city,
      style: GoogleFonts.abel(
        color: Colors.white,
        fontSize: MediaQuery.of(context).size.height / heightValue,
      ),
    );
  }

  Widget weatherStatus({required String weather, required double heightValue}) {
    return Text(
      weather.toString(),
      style: GoogleFonts.abel(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.height / heightValue),
    );
  }

  Widget tempValue({required String temp, required double fontSizeWidth}) {
    return Text(
      '${((double.parse(temp) - 273.15).round()).toString()}\u2103',
      style: GoogleFonts.abel(
        color: Colors.white,
        fontSize: MediaQuery.of(context).size.width * fontSizeWidth,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget weatherImage(
      {required String weatherStatus, required double heightValue}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * heightValue,
      child: weatherStatus == 'Clear'
          ? Image.asset('assets/images/sun.png')
          : weatherStatus == 'Clouds'
              ? Image.asset('assets/images/cloud_computing.png')
              : Image.asset('assets/images/cloud_computing.png'),
    );
  }

  Widget shadowImage({required double heightValue}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * heightValue,
      child: Image.asset('assets/images/shadow.png'),
    );
  }
}
