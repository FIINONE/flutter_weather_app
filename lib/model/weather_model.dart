// import 'package:flutter_lesson_1/utilities/constants.dart';

// class WeatherModel {
//   City? city;
//   String? cod;
//   double? message;
//   int? cnt;
//   List<Daily>? daily;

//   WeatherModel({this.city, this.cod, this.message, this.cnt, this.daily});

//   WeatherModel.fromJson(Map<String, dynamic> json) {
//     if (json['city'] is Map)
//       this.city = json['city'] == null
//           ? null
//           : City.fromJson(json['city'] as Map<String, dynamic>);
//     if (json['cod'] is String) this.cod = json['cod'] as String;
//     if (json['message'] is double) this.message = json['message'] as double;
//     if (json['cnt'] is int) this.cnt = json['cnt'] as int;
//     if (json['list'] is List)
//       this.daily = json['list'] == null
//           ? null
//           : (json['list'] as List)
//               .map((dynamic e) => Daily.fromJson(e as Map<String, dynamic>))
//               .toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.city != null) data['city'] = this.city?.toJson();
//     data['cod'] = this.cod;
//     data['message'] = this.message;
//     data['cnt'] = this.cnt;
//     if (this.daily != null)
//       data['list'] = this.daily?.map((e) => e.toJson()).toList();
//     return data;
//   }
// }

// class Daily {
//   int? dt;
//   int? sunrise;
//   int? sunset;
//   Temp? temp;
//   FeelsLike? feelsLike;
//   int? pressure;
//   int? humidity;
//   List<Weather>? weather;
//   double? speed;
//   int? deg;
//   double? gust;
//   int? clouds;
//   double? pop;

//   Daily(
//       {this.dt,
//       this.sunrise,
//       this.sunset,
//       this.temp,
//       this.feelsLike,
//       this.pressure,
//       this.humidity,
//       this.weather,
//       this.speed,
//       this.deg,
//       this.gust,
//       this.clouds,
//       this.pop});

//   String getIconUrl() {
//     return Constants.weatherImagesUrl + weather![0].icon + '.png';
//   }

//   Daily.fromJson(Map<String, dynamic> json) {
//     if (json['dt'] is int) this.dt = json['dt'] as int;
//     if (json['sunrise'] is int) this.sunrise = json['sunrise'] as int;
//     if (json['sunset'] is int) this.sunset = json['sunset'] as int;
//     if (json['temp'] is Map)
//       this.temp = json['temp'] == null
//           ? null
//           : Temp.fromJson(json['temp'] as Map<String, dynamic>);
//     if (json['feels_like'] is Map)
//       this.feelsLike = json['feels_like'] == null
//           ? null
//           : FeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>);
//     if (json['pressure'] is int) this.pressure = json['pressure'] as int;
//     if (json['humidity'] is int) this.humidity = json['humidity'] as int;
//     if (json['weather'] is List)
//       this.weather = json['weather'] == null
//           ? null
//           : (json['weather'] as List)
//               .map((dynamic e) => Weather.fromJson(e as Map<String, dynamic>))
//               .toList();
//     if (json['speed'] is double) this.speed = json['speed'] as double;
//     if (json['deg'] is int) this.deg = json['deg'] as int;
//     if (json['gust'] is double) this.gust = json['gust'] as double;
//     if (json['clouds'] is int) this.clouds = json['clouds'] as int;
//     if (json['pop'] is double) this.pop = json['pop'] as double;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['dt'] = this.dt;
//     data['sunrise'] = this.sunrise;
//     data['sunset'] = this.sunset;
//     if (this.temp != null) data['temp'] = this.temp?.toJson();
//     if (this.feelsLike != null) data['feels_like'] = this.feelsLike?.toJson();
//     data['pressure'] = this.pressure;
//     data['humidity'] = this.humidity;
//     if (this.weather != null)
//       data['weather'] = this.weather?.map((e) => e.toJson()).toList();
//     data['speed'] = this.speed;
//     data['deg'] = this.deg;
//     data['gust'] = this.gust;
//     data['clouds'] = this.clouds;
//     data['pop'] = this.pop;
//     return data;
//   }
// }

// class Weather {
//    late int id;
//    late String main;
//    late String description;
//    late String icon;

//   Weather({
//     required this.id,
//     required this.main,
//     required this.description,
//     required this.icon,
//   });

//   Weather.fromJson(Map<String, dynamic> json) {
//     id = json['id'] as int;
//     if (json['main'] is String) this.main = json['main'] as String;
//     if (json['description'] is String)
//       this.description = json['description'] as String;
//     if (json['icon'] is String) this.icon = json['icon'] as String;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['main'] = this.main;
//     data['description'] = this.description;
//     data['icon'] = this.icon;
//     return data;
//   }
// }

// class FeelsLike {
//   double? day;
//   double? night;
//   double? eve;
//   double? morn;

//   FeelsLike({this.day, this.night, this.eve, this.morn});

//   FeelsLike.fromJson(Map<String, dynamic> json) {
//     if (json['day'] is double) this.day = json['day'] as double;
//     if (json['night'] is double) this.night = json['night'] as double;
//     if (json['eve'] is double) this.eve = json['eve'] as double;
//     if (json['morn'] is double) this.morn = json['morn'] as double;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['day'] = this.day;
//     data['night'] = this.night;
//     data['eve'] = this.eve;
//     data['morn'] = this.morn;
//     return data;
//   }
// }

// class Temp {
//   double? day;
//   double? min;
//   double? max;
//   double? night;
//   double? eve;
//   double? morn;

//   Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

//   Temp.fromJson(Map<String, dynamic> json) {
//     if (json['day'] is double) this.day = json['day'] as double;
//     if (json['min'] is double) this.min = json['min'] as double;
//     if (json['max'] is double) this.max = json['max'] as double;
//     if (json['night'] is double) this.night = json['night'] as double;
//     if (json['eve'] is double) this.eve = json['eve'] as double;
//     if (json['morn'] is double) this.morn = json['morn'] as double;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['day'] = this.day;
//     data['min'] = this.min;
//     data['max'] = this.max;
//     data['night'] = this.night;
//     data['eve'] = this.eve;
//     data['morn'] = this.morn;
//     return data;
//   }
// }

// class City {
//   int? id;
//   String? name;
//   Coord? coord;
//   String? country;
//   int? population;
//   int? timezone;

//   City(
//       {this.id,
//       this.name,
//       this.coord,
//       this.country,
//       this.population,
//       this.timezone});

//   City.fromJson(Map<String, dynamic> json) {
//     if (json['id'] is int) this.id = json['id'] as int;
//     if (json['name'] is String) this.name = json['name'] as String;
//     if (json['coord'] is Map)
//       this.coord = json['coord'] == null
//           ? null
//           : Coord.fromJson(json['coord'] as Map<String, dynamic>);
//     if (json['country'] is String) this.country = json['country'] as String;
//     if (json['population'] is int) this.population = json['population'] as int;
//     if (json['timezone'] is int) this.timezone = json['timezone'] as int;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     if (this.coord != null) data['coord'] = this.coord?.toJson();
//     data['country'] = this.country;
//     data['population'] = this.population;
//     data['timezone'] = this.timezone;
//     return data;
//   }
// }

// class Coord {
//   double? lon;
//   double? lat;

//   Coord({this.lon, this.lat});

//   Coord.fromJson(Map<String, dynamic> json) {
//     if (json['lon'] is double) this.lon = json['lon'] as double;
//     if (json['lat'] is double) this.lat = json['lat'] as double;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['lon'] = this.lon;
//     data['lat'] = this.lat;
//     return data;
//   }
// }
