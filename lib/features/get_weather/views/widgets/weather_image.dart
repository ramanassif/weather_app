import 'package:flutter/material.dart';

class WeatherImage extends StatelessWidget {
  final String weatherStatus;
  final double heightValue;

  const WeatherImage({
    Key? key,
    required this.weatherStatus,
    required this.heightValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * heightValue,
      child: weatherStatus == 'Clear'
          ? Image.asset('assets/images/sun.png')
          : weatherStatus == 'Clouds'
              ? Image.asset('assets/images/cloud_computing.png')
              : weatherStatus == 'Rain'
                  ? Image.asset('assets/images/rainy.png')
                  : Image.asset('assets/images/cloud_computing.png'),
    );
  }
}
