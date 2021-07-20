import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_lesson_1/model/city_history_model.dart';

class CityHistoryView extends StatelessWidget {
  final CityHistoryModel contextWatch;

  const CityHistoryView({
    Key? key,
    required this.contextWatch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cityCounter = contextWatch.cityname.length;

    return ListView.separated(
      itemCount: cityCounter,
      itemBuilder: (context, int index) {
        final cityName = contextWatch.cityname[index].name.toUpperCase();
        final color = index.isEven ? Colors.grey[200]! : Colors.white;
        return Material(
          child: Ink(
            color: color,
            child: InkWell(
              splashColor: Colors.green,
              child: Text('${index + 1}. $cityName'),
              onTap: () => context
                  .read<CityHistoryModel>()
                  .popCityfromHistory(index, context),
            ),
          ),
        );
      },
      separatorBuilder: (context, int index) {
        return const Divider(
          color: Colors.black,
          thickness: 1,
          height: 1,
        );
      },
    );
  }
}
