import 'package:flutter_lesson_1/utilities/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_data.g.dart';

@JsonSerializable()
class WeatherModel {
  final String cod;
  final int message;
  final int cnt;
  @JsonKey(name: 'list')
  List<Daily> daily;
  City city;

  WeatherModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.daily,
    required this.city,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> source) =>
      _$WeatherModelFromJson(source);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class Daily {
  @JsonKey(name: 'dt')
  final int date;
  final Main main;
  final List<Weather> weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final double pop;
  final Rain? rain;
  final Sys sys;
  @JsonKey(name: 'dt_txt')
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

  factory Daily.fromJson(Map<String, dynamic> source) =>
      _$DailyFromJson(source);

  Map<String, dynamic> toJson() => _$DailyToJson(this);
}

@JsonSerializable()
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

  factory City.fromJson(Map<String, dynamic> source) => _$CityFromJson(source);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class Main {
  final double temp;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  @JsonKey(name: 'temp_min')
  final double tempMin;
  @JsonKey(name: 'temp_max')
  final double tempMax;
  final int pressure;
  @JsonKey(name: 'sea_level')
  final int seaLevel;
  @JsonKey(name: 'grnd_level')
  final int grndLevel;
  final int humidity;
  @JsonKey(name: 'temp_kf')
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

  factory Main.fromJson(Map<String, dynamic> source) => _$MainFromJson(source);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}

@JsonSerializable()
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

  factory Weather.fromJson(Map<String, dynamic> source) =>
      _$WeatherFromJson(source);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Clouds {
  final int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> source) =>
      _$CloudsFromJson(source);

  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}

@JsonSerializable()
class Wind {
  final double speed;
  final double deg;
  final double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> source) => _$WindFromJson(source);

  Map<String, dynamic> toJson() => _$WindToJson(this);
}

@JsonSerializable()
class Rain {
  @JsonKey(name: '3h')
  final double treeH;

  Rain({
    required this.treeH,
  });

  factory Rain.fromJson(Map<String, dynamic> source) => _$RainFromJson(source);

  Map<String, dynamic> toJson() => _$RainToJson(this);
}

@JsonSerializable()
class Sys {
  final String pod;

  Sys({
    required this.pod,
  });

  factory Sys.fromJson(Map<String, dynamic> source) => _$SysFromJson(source);

  Map<String, dynamic> toJson() => _$SysToJson(this);
}

@JsonSerializable()
class Coord {
  final double lat;
  final double lon;

  Coord({
    required this.lat,
    required this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> source) =>
      _$CoordFromJson(source);

  Map<String, dynamic> toJson() => _$CoordToJson(this);
}
