import 'package:flutter/material.dart';
import 'package:flutter_lesson_1/model/weather_data_copy.dart';
import 'package:flutter_lesson_1/utilities/weather_utilities.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailedView extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshot;
  DetailedView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int pressure =
        (snapshot.data!.daily[0].main.pressure * 0.750062).round();
    final int humidity = snapshot.data!.daily[0].main.humidity;
    final int wind = snapshot.data!.daily[0].wind.speed.toInt();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Util.getItem(
            FontAwesomeIcons.thermometerThreeQuarters, pressure, 'mm Hg'),
        Util.getItem(FontAwesomeIcons.cloudRain, humidity, '%'),
        Util.getItem(FontAwesomeIcons.wind, wind, 'm/s'),
      ],
    );
  }
}
