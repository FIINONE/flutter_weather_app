import 'dart:developer';

// import 'package:flutter_lesson_1/model/weather_ex.dart';
// import 'package:flutter_lesson_1/model/weather_data.dart';
import 'package:flutter_lesson_1/model/weather_data_copy.dart';
import 'package:flutter_lesson_1/utilities/constants.dart';
import 'package:flutter_lesson_1/utilities/location.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherModel> fetchWeather(
      {String? cityName = 'Tashkent', bool? isCity}) async {
    final Location location = Location();

    await location.getCurrentLocation();

    Map<String, String?> parametr;

    if (isCity == true) {
      final queryParametr = {
        'q': cityName,
        'units': 'metric',
        'appid': Constants.weatherAppId,
      };
      parametr = queryParametr;
    } else {
      final queryParametr = {
        'units': 'metric',
        'appid': Constants.weatherAppId,
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };
      parametr = queryParametr;
    }

    final uri = Uri.https(
        Constants.weatherBaseUrlDomain, Constants.weatherDailyPath, parametr);

    log('request: ${uri.toString()}');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.body);

      // return WeatherModel.fromJson(
      //     json.decode(response.body) as Map<String, dynamic>);
    } else {
      return Future.error('Error response');
    }
  }
}
