import 'package:flutter/material.dart';
import 'package:flutter_lesson_1/api/weather_api.dart';
import 'package:flutter_lesson_1/model/weather_data_copy.dart';
import 'package:flutter_lesson_1/screen/weather_forecast.dart';

class LocationScreen extends StatefulWidget {
  static const String mainRoute = '/';
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Future<void> getLocationData() async {
    try {
      final WeatherModel weatherInfo = await WeatherApi().fetchWeather();
      Navigator.pushNamed(context, WeatherForecastScreen.routeName,
          arguments: weatherInfo);
    } catch (e) {
      throw 'Error in Location Screen: $e';
    }
  }

  @override
  void initState() {
    super.initState();

    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
