import 'package:flutter/material.dart';
// import 'package:flutter_lesson_1/model/weather_ex.dart';
// import 'package:flutter_lesson_1/model/weather_data.dart';
import 'package:flutter_lesson_1/model/weather_data_copy.dart';
import 'package:flutter_lesson_1/utilities/weather_utilities.dart';

class CityView extends StatelessWidget {
  AsyncSnapshot<WeatherModel> snapshot;

  CityView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var city = snapshot.data?.city?.name;
    final city = snapshot.data?.city.name;
    // var country = snapshot.data?.city?.country;
    final country = snapshot.data?.city.country;
    // var dateInt = snapshot.data?.daily?[0].dt;
    final dateInt = snapshot.data?.daily[0].date;
    final date = DateTime.fromMillisecondsSinceEpoch(dateInt! * 1000);

    return Column(
      children: [
        Text(
          '$city $country',
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          Util.getFormatdate(date),
        ),
      ],
    );
  }
}
