import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormatdate(DateTime dateTime) {
    return DateFormat('EEE, MMMM d, y').format(dateTime);
  }

  static String getDayOfWeeak(DateTime dateTime) {
    return DateFormat('E').format(dateTime);
  }

  static String getHour(DateTime dateTime) {
    return DateFormat.Hm().format(dateTime);
  }

  static Widget getItem(IconData icondata, int value, String units) {
    return Column(
      children: [
        Icon(icondata),
        Text('$value'),
        Text(units),
      ],
    );
  }
}
