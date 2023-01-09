import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/basics_widgets/error_message.dart';
import 'package:weather_app/core/basics_widgets/generic_loader.dart';
import 'package:weather_app/features/get_weather/bloc/weather_bloc.dart';
import 'package:weather_app/features/get_weather/models/weather_model.dart';
import 'package:weather_app/features/get_weather/views/widgets/landscape_orientation_content_weatherScreen.dart';
import 'package:weather_app/features/get_weather/views/widgets/portrait_orientation_content_weatherScreen.dart';

class WeatherScreenBody extends StatefulWidget {
  const WeatherScreenBody({Key? key}) : super(key: key);

  @override
  State<WeatherScreenBody> createState() => _WeatherScreenBodyState();
}

class _WeatherScreenBodyState extends State<WeatherScreenBody> {
  WeatherModel? weatherModel;

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
          weatherModel = state.weatherModel;
          print(weatherModel!.dateTime);
          return orientationScreen == Orientation.portrait
              ? PortraitOrientationContentWeatherScreen(weatherModel: weatherModel!,)
              : LandscapeOrientationContentWeatherScreen(weatherModel: weatherModel!,);
        } else if (state is WeatherFailure) {
          return const ErrorMessage(
            message: 'Something went wrong, Please try again',
          );
        } else {
          return const Center(
            child: ErrorMessage(
              message: 'Failed, Please try again',
            ),
          );
        }
      },
    );
  }
}
