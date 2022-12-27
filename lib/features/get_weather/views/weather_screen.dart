import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherScreen extends StatefulWidget {
  static String routeName = '/weather_screen';

  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.orangeAccent,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Text(
                            "It's \nSunny \nDay",
                            style: GoogleFonts.abel(
                                color: Colors.white, fontSize: 40),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.25,
                          left: MediaQuery.of(context).size.width * 0.35,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Image.asset('assets/images/sun.png'),
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
                      'Aleppo',
                      style: GoogleFonts.abel(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '10',
                          style: GoogleFonts.abel(
                            color: Colors.white,
                            fontSize: 120,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 80,
                        ),
                        const Spacer(),
                        Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 80,
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
    );
  }
}
