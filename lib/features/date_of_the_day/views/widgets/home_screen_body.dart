import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';

class Body extends StatefulWidget {
  final DateTime firstDay;
  final DateTime secondDay;
  final DateTime thirdDay;
  final List<Widget> dates;

  const Body(
      {Key? key,
      required this.firstDay,
      required this.secondDay,
      required this.thirdDay,
      required this.dates})
      : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var orientationScreen = MediaQuery.of(context).orientation;

    return orientationScreen == Orientation.portrait
        ? Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    backgroundImage(boxFit: BoxFit.fill),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          dateContainer(
                            child: widget.dates[0],
                            widthValue: 1,
                            heightValue: 2,
                            dateTime: widget.firstDay,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              dateContainer(
                                child: widget.dates[1],
                                widthValue: 2.5,
                                heightValue: 4,
                                dateTime: widget.secondDay,
                              ),
                              dateContainer(
                                child: widget.dates[2],
                                widthValue: 2.5,
                                heightValue: 4,
                                dateTime: widget.thirdDay,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                backgroundImage(boxFit: BoxFit.fitWidth),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        dateContainer(
                          child: widget.dates[0],
                          heightValue: 2,
                          widthValue: 4,
                          dateTime: widget.firstDay,
                        ),
                        dateContainer(
                          child: widget.dates[1],
                          heightValue: 2,
                          widthValue: 4,
                          dateTime: widget.secondDay,
                        ),
                        dateContainer(
                          child: widget.dates[2],
                          heightValue: 2,
                          widthValue: 4,
                          dateTime: widget.thirdDay,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Widget dateContainer(
      {required Widget child,
      required double heightValue,
      required double widthValue,
      required DateTime dateTime}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          weatherScreen,
          arguments: {
            'data_time': dateTime,
          },
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / widthValue,
        height: MediaQuery.of(context).size.height / heightValue,
        decoration: BoxDecoration(
          color: Colors.black54.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    );
  }

  Widget backgroundImage({required BoxFit boxFit}) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        'assets/images/city_background.jpg',
        fit: boxFit,
        filterQuality: FilterQuality.low,
      ),
    );
  }
}
