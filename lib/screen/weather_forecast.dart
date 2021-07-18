import 'package:flutter/material.dart';
import 'package:flutter_lesson_1/api/weather_api.dart';
// import 'package:flutter_lesson_1/model/weather_ex.dart';
// import 'package:flutter_lesson_1/model/weather_data.dart';
import 'package:flutter_lesson_1/model/weather_data_copy.dart';
import 'package:flutter_lesson_1/screen/location_screen.dart';
import 'package:flutter_lesson_1/utilities/constants.dart';
import 'package:flutter_lesson_1/widgets/city_view.dart';
import 'package:flutter_lesson_1/widgets/daily_view.dart';
import 'package:flutter_lesson_1/widgets/datailed_view.dart';
import 'package:flutter_lesson_1/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  static const String routeName = '/weather_screem';

  final WeatherModel locationWeather;

  const WeatherForecastScreen({Key? key, required this.locationWeather})
      : super(key: key);

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherModel> _weatherObject;

  String? _cityName;

  @override
  void initState() {
    super.initState();

    _weatherObject = Future.value(widget.locationWeather);

    // _weatherObject.then((value) => print(value.daily[0].weather[0].icon));

    // _weatherObject
    //     .then((weather) => print(weather.daily[0].weather[0].main));
    // _weatherObject.then((value) => print(value.daily?[0].dt));
    // _weatherObject.then((value) => print(value.daily[0].date));
    // _weatherObject.then((value) => print(value.city?.name));
    // _weatherObject.then((value) => print(value.city.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              _weatherObject = WeatherApi().fetchWeather();
            });
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_city),
            onPressed: () async {
              final tappedName =
                  await Navigator.of(context).pushNamed('/city_screen');
              if (tappedName != null) {
                _cityName = '$tappedName';
                _weatherObject = WeatherApi()
                    .fetchWeather(cityName: _cityName, isCity: true);
                setState(() {});
              }
            },
          )
        ],
      ),
      body: FutureBuilder<WeatherModel>(
        future: _weatherObject,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CityView(snapshot: snapshot),
                const SizedBox(height: 20),
                TempView(snapshot: snapshot),
                const SizedBox(height: 20),
                DetailedView(snapshot: snapshot),
                const SizedBox(height: 20),
                Expanded(child: DailyView(snapshot: snapshot)),
              ],
            );
          } else {
            return const Center(
              child: Text(
                'City is not found\nPlease enter correct city name',
                style: TextStyle(color: Colors.red, fontSize: 25),
                textAlign: TextAlign.center,
              ),
            );
          }
        },
      ),
    );
  }
}
