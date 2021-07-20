import 'package:flutter/material.dart';
import 'package:flutter_lesson_1/model/weather_data_copy.dart';
import 'package:flutter_lesson_1/screen/city_screen.dart';
import 'package:flutter_lesson_1/screen/location_screen.dart';
import 'package:flutter_lesson_1/screen/weather_forecast.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        LocationScreen.mainRoute: (context) => const LocationScreen(),
        WeatherForecastScreen.routeName: (context) {
          final location =
              ModalRoute.of(context)!.settings.arguments as WeatherModel;
          return WeatherForecastScreen(
            locationWeather: location,
          );
        },
        CityScreen.routeName: (BuildContext context) => const CityScreen(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
