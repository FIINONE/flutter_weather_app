import 'package:flutter/material.dart';

import 'package:flutter_lesson_1/model/weather_data_copy.dart';
import 'package:flutter_lesson_1/utilities/weather_utilities.dart';

class DailyView extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshot;

  const DailyView({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cnt = snapshot.data?.cnt;

    return ListView.separated(
      shrinkWrap: true,
      itemCount: cnt!,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, int index) {
        final dateInt = snapshot.data?.daily[index].date;
        final dateTime = DateTime.fromMillisecondsSinceEpoch(dateInt! * 1000);
        final date = Util.getDayOfWeeak(dateTime);
        final hour = Util.getHour(dateTime);
        final icon = snapshot.data?.daily[index].getIconUrl();
        final temp = snapshot.data?.daily[0].main.temp.toStringAsFixed(0);
        return SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: Column(
            children: [
              Image.network(icon!),
              RichText(
                text: TextSpan(
                    text: '$date, ',
                    style: const TextStyle(fontSize: 25, color: Colors.black),
                    children: [
                      TextSpan(
                        text: hour,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ]),
              ),
              Text(
                '$temp °C',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, int index) {
        return const VerticalDivider(
          thickness: 1,
        );
      },
    );
  }
}
