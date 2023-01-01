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
                                      child: Text(
                                        weatherModel!.weather.toString(),
                                        style: GoogleFonts.abel(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                10),
                                      ),
                                    ),
                                    Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.15,
                                      left: MediaQuery.of(context).size.width *
                                          0.35,
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        child: weatherModel!.weather == 'Clear'
                                            ? Image.asset(
                                                'assets/images/sun.png')
                                            : weatherModel!.weather == 'Clouds'
                                                ? Image.asset(
                                                    'assets/images/cloud_computing.png')
                                                : Image.asset(
                                                    'assets/images/cloud_computing.png'),
                                      ),
                                    ),
                                    Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.55,
                                      left: MediaQuery.of(context).size.width *
                                          0.35,
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        child: Image.asset(
                                            'assets/images/shadow.png'),
                                      ),
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
                                Text(
                                  'Dubai',
                                  style: GoogleFonts.abel(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height / 12,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${((double.parse(weatherModel!.temp) - 273.15).round()).toString()}\u2103',
                                        style: GoogleFonts.abel(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Container(
                                      color: Colors.white,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              7,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Wind:',
                                              style: GoogleFonts.lato(
                                                  color: Colors.grey,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                                '${weatherModel!.windSpeed}Km/h',
                                                style: GoogleFonts.abel(
                                                    color: Colors.black,
                                                    fontSize: 20)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    Container(
                                      color: Colors.white,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              7,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'humidity:',
                                              style: GoogleFonts.lato(
                                                  color: Colors.grey,
                                                  fontSize: 20),
                                            ),
                                            Text('${weatherModel!.humidity}%',
                                                style: GoogleFonts.abel(
                                                    color: Colors.black,
                                                    fontSize: 20)),
                                          ],
                                        ),
                                      ),
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
                                Text(
                                  weatherModel!.weather.toString(),
                                  style: GoogleFonts.abel(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              6),
                                ),
                                Text(
                                  '${((double.parse(weatherModel!.temp) - 273.15).round()).toString()}\u2103',
                                  style: GoogleFonts.abel(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                ),
                                Text(
                                  'Dubai',
                                  style: GoogleFonts.abel(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height / 10,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    child: weatherModel!.weather == 'Clear'
                                        ? Image.asset('assets/images/sun.png')
                                        : weatherModel!.weather == 'Clouds'
                                            ? Image.asset(
                                                'assets/images/cloud_computing.png')
                                            : Image.asset(
                                                'assets/images/cloud_computing.png'),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    child:
                                        Image.asset('assets/images/shadow.png'),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  color: Colors.white,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Wind:',
                                          style: GoogleFonts.lato(
                                              color: Colors.grey, fontSize: 20),
                                        ),
                                        Text('${weatherModel!.windSpeed}Km/h',
                                            style: GoogleFonts.abel(
                                                color: Colors.black,
                                                fontSize: 20)),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'humidity:',
                                          style: GoogleFonts.lato(
                                              color: Colors.grey, fontSize: 20),
                                        ),
                                        Text('${weatherModel!.humidity}%',
                                            style: GoogleFonts.abel(
                                                color: Colors.black,
                                                fontSize: 20)),
                                      ],
                                    ),
                                  ),
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
}
