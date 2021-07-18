import 'dart:convert';

import 'package:flutter_lesson_1/utilities/constants.dart';

class WeatherModel {
  final String cod;
  final int? message;
  final int cnt;
  List<Daily> daily;
  City city;

  WeatherModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.daily,
    required this.city,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cod': cod,
      'message': message,
      'cnt': cnt,
      'list': daily.map((x) => x.toMap()).toList(),
      'city': city.toMap(),
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      cod: map['cod'] as String,
      message: map['message'] as int,
      cnt: map['cnt'] as int,
      daily: List<Daily>.from((map['list'] as List<dynamic>)
          .map((dynamic x) => Daily.fromMap(x as Map<String, dynamic>))
          .toList()),
      city: City.fromMap(map['city'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Daily {
  final int date;
  final Main main;
  final List<Weather> weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final double pop;
  final Rain? rain;
  final Sys sys;
  final String dtTxt;

  Daily({
    required this.date,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    this.rain,
    required this.sys,
    required this.dtTxt,
  });

  String getIconUrl() {
    return Constants.weatherImagesUrl + weather[0].icon + '.png';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dt': date,
      'main': main.toMap(),
      'weather': weather.map((x) => x.toMap()).toList(),
      'clouds': clouds.toMap(),
      'wind': wind.toMap(),
      'visibility': visibility,
      'pop': pop,
      'rain': rain?.toMap(),
      'sys': sys.toMap(),
      'dt_txt': dtTxt,
    };
  }

  factory Daily.fromMap(Map<String, dynamic> map) {
    return Daily(
      date: map['dt'] as int,
      main: Main.fromMap(map['main'] as Map<String, dynamic>),
      weather: List<Weather>.from((map['weather'] as List<dynamic>)
          .map(
            (dynamic x) => Weather.fromMap(x as Map<String, dynamic>),
          )
          .toList()),
      clouds: Clouds.fromMap(map['clouds'] as Map<String, dynamic>),
      wind: Wind.fromMap(map['wind'] as Map<String, dynamic>),
      visibility: map['visibility'] as int,
      pop: map['pop'].toDouble() as double,
      rain: map['rain'] == null
          ? null
          : Rain.fromMap(map['rain'] as Map<String, dynamic>),
      sys: Sys.fromMap(map['sys'] as Map<String, dynamic>),
      dtTxt: map['dt_txt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Daily.fromJson(String source) =>
      Daily.fromMap(json.decode(source) as Map<String, dynamic>);
}

class City {
  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'coord': coord.toMap(),
      'country': country,
      'population': population,
      'timezone': timezone,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['id'] as int,
      name: map['name'] as String,
      coord: Coord.fromMap(map['coord'] as Map<String, dynamic>),
      country: map['country'] as String,
      population: map['population'] as int,
      timezone: map['timezone'] as int,
      sunrise: map['sunrise'] as int,
      sunset: map['sunset'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) =>
      City.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int seaLevel;
  final int grndLevel;
  final int humidity;
  final double tempKf;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'sea_level': seaLevel,
      'grnd_level': grndLevel,
      'humidity': humidity,
      'temp_kf': tempKf,
    };
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp'].toDouble() as double,
      feelsLike: map['feels_like'].toDouble() as double,
      tempMin: map['temp_min'].toDouble() as double,
      tempMax: map['temp_max'].toDouble() as double,
      pressure: map['pressure'] as int,
      seaLevel: map['sea_level'] as int,
      grndLevel: map['grnd_level'] as int,
      humidity: map['humidity'] as int,
      tempKf: map['temp_kf'].toDouble() as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Main.fromJson(String source) =>
      Main.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id'] as int,
      main: map['main'] as String,
      description: map['description'] as String,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Clouds {
  final int all;

  Clouds({
    required this.all,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'all': all,
    };
  }

  factory Clouds.fromMap(Map<String, dynamic> map) {
    return Clouds(
      all: map['all'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Clouds.fromJson(String source) =>
      Clouds.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Wind {
  double speed;
  double deg;
  double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'speed': speed,
      'deg': deg,
      'gust': gust,
    };
  }

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed'].toDouble() as double,
      deg: map['deg'].toDouble() as double,
      gust: map['gust'].toDouble() as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wind.fromJson(String source) =>
      Wind.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Rain {
  final double treeH;

  Rain({
    required this.treeH,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '3h': treeH,
    };
  }

  factory Rain.fromMap(Map<String, dynamic> map) {
    return Rain(
      treeH: map['3h'].toDouble() as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rain.fromJson(String source) =>
      Rain.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Sys {
  final String pod;

  Sys({
    required this.pod,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pod': pod,
    };
  }

  factory Sys.fromMap(Map<String, dynamic> map) {
    return Sys(
      pod: map['pod'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sys.fromJson(String source) =>
      Sys.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Coord {
  final double lat;
  final double lon;

  Coord({
    required this.lat,
    required this.lon,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lon': lon,
    };
  }

  factory Coord.fromMap(Map<String, dynamic> map) {
    return Coord(
      lat: map['lat'].toDouble() as double,
      lon: map['lon'].toDouble() as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coord.fromJson(String source) =>
      Coord.fromMap(json.decode(source) as Map<String, dynamic>);
}
