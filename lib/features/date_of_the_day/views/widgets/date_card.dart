import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';

class DateCard extends StatefulWidget {
  final double widthValue;
  final double heightValue;
  final DateTime dateTime;
  final Widget child;

  const DateCard({
    Key? key,
    required this.widthValue,
    required this.heightValue,
    required this.dateTime,
    required this.child,
  }) : super(key: key);

  @override
  State<DateCard> createState() => _DateCardState();
}

class _DateCardState extends State<DateCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          weatherScreen,
          arguments: {
            'data_time': widget.dateTime,
          },
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / widget.widthValue,
        height: MediaQuery.of(context).size.height / widget.heightValue,
        decoration: BoxDecoration(
          color: Colors.black54.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: widget.child,
      ),
    );
  }
}
