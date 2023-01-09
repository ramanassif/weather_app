import 'package:flutter/material.dart';
import 'package:weather_app/features/date_of_the_day/views/widgets/home_screen_body.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Colors.black,
      ),
      body: const HomeScreenBody(),
    );
  }
}
