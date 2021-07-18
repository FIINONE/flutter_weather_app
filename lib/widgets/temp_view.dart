import 'package:flutter/material.dart';

// import 'package:flutter_lesson_1/model/weather_ex.dart';
// import 'package:flutter_lesson_1/model/weather_data.dart';
import 'package:flutter_lesson_1/model/weather_data_copy.dart';

class TempView extends StatelessWidget {
  AsyncSnapshot<WeatherModel> snapshot;

  TempView({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final icon = snapshot.data?.daily?[0].getIconUrl();
    final icon = snapshot.data?.daily[0].getIconUrl();
    // final temp = snapshot.data?.daily?[0].main?.temp?.toStringAsFixed(0);
    final temp = snapshot.data?.daily[0].main.temp.toStringAsFixed(0);
    final describtion = snapshot.data?.daily[0].weather[0].description; 
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          icon!,
          scale: 0.5,
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            Text(
              '$temp °C',
              style: const TextStyle(fontSize: 50),
            ),
            Text(describtion!),
          ],
        )
      ],
    );
  }
}
