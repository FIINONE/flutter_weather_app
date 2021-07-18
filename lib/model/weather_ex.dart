// import 'package:flutter_lesson_1/utilities/constants.dart';

// class WeatherModel {
//   String? cod;
//   int? message;
//   int? cnt;
//   List<Daily>? daily;
//   City? city;

//   WeatherModel({this.cod, this.message, this.cnt, this.daily, this.city});

//   WeatherModel.fromJson(Map<String, dynamic> json) {
//     if (json['cod'] is String) this.cod = json['cod'] as String;
//     if (json['message'] is int) this.message = json['message'] as int;
//     if (json['cnt'] is int) this.cnt = json['cnt'] as int;
//     if (json['list'] is List)
//       this.daily = json['list'] == null
//           ? null
//           : (json['list'] as List)
//               .map((dynamic e) => Daily.fromJson(e as Map<String, dynamic>))
//               .toList();
//     if (json['city'] is Map)
//       this.city = json['city'] == null
//           ? null
//           : City.fromJson(json['city'] as Map<String, dynamic>);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['cod'] = this.cod;
//     data['message'] = this.message;
//     data['cnt'] = this.cnt;
//     if (this.daily != null)
//       data['list'] = this.daily?.map((e) => e.toJson()).toList();
//     if (this.city != null) data['city'] = this.city?.toJson();
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
//   int? sunrise;
//   int? sunset;

//   City(
//       {this.id,
//       this.name,
//       this.coord,
//       this.country,
//       this.population,
//       this.timezone,
//       this.sunrise,
//       this.sunset});

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
//     if (json['sunrise'] is int) this.sunrise = json['sunrise'] as int;
//     if (json['sunset'] is int) this.sunset = json['sunset'] as int;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     if (this.coord != null) data['coord'] = this.coord?.toJson();
//     data['country'] = this.country;
//     data['population'] = this.population;
//     data['timezone'] = this.timezone;
//     data['sunrise'] = this.sunrise;
//     data['sunset'] = this.sunset;
//     return data;
//   }
// }

// class Coord {
//   double? lat;
//   double? lon;

//   Coord({this.lat, this.lon});

//   Coord.fromJson(Map<String, dynamic> json) {
//     if (json['lat'] is double) this.lat = json['lat'] as double;
//     if (json['lon'] is double) this.lon = json['lon'] as double;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['lat'] = this.lat;
//     data['lon'] = this.lon;
//     return data;
//   }
// }

// class Daily {
//   int? dt;
//   Main? main;
//   List<Weather>? weather;
//   Clouds? clouds;
//   Wind? wind;
//   int? visibility;
//   int? pop;
//   Rain? rain;
//   Sys? sys;
//   String? dtTxt;

//   Daily(
//       {this.dt,
//       this.main,
//       this.weather,
//       this.clouds,
//       this.wind,
//       this.visibility,
//       this.pop,
//       this.rain,
//       this.sys,
//       this.dtTxt});

//   String getIconUrl() {
//     return Constants.weatherImagesUrl + (weather![0].icon)! + '.png';
//   }

//   Daily.fromJson(Map<String, dynamic> json) {
//     if (json['dt'] is int) this.dt = json['dt'] as int;
//     if (json['main'] is Map)
//       this.main = json['main'] == null
//           ? null
//           : Main.fromJson(json['main'] as Map<String, dynamic>);
//     if (json['weather'] is List)
//       this.weather = json['weather'] == null
//           ? null
//           : (json['weather'] as List)
//               .map((dynamic e) => Weather.fromJson(e as Map<String, dynamic>))
//               .toList();
//     if (json['clouds'] is Map)
//       this.clouds = json['clouds'] == null
//           ? null
//           : Clouds.fromJson(json['clouds'] as Map<String, dynamic>);
//     if (json['wind'] is Map)
//       this.wind = json['wind'] == null
//           ? null
//           : Wind.fromJson(json['wind'] as Map<String, dynamic>);
//     if (json['visibility'] is int) this.visibility = json['visibility'] as int;
//     if (json['pop'] is int) this.pop = json['pop'] as int;
//     if (json['rain'] is Map)
//       this.rain = json['rain'] == null
//           ? null
//           : Rain.fromJson(json['rain'] as Map<String, dynamic>);
//     if (json['sys'] is Map)
//       this.sys = json['sys'] == null
//           ? null
//           : Sys.fromJson(json['sys'] as Map<String, dynamic>);
//     if (json['dt_txt'] is String) this.dtTxt = json['dt_txt'] as String;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['dt'] = this.dt;
//     if (this.main != null) data['main'] = this.main?.toJson();
//     if (this.weather != null)
//       data['weather'] = this.weather?.map((e) => e.toJson()).toList();
//     if (this.clouds != null) data['clouds'] = this.clouds?.toJson();
//     if (this.wind != null) data['wind'] = this.wind?.toJson();
//     data['visibility'] = this.visibility;
//     data['pop'] = this.pop;
//     if (this.rain != null) data['rain'] = this.rain?.toJson();
//     if (this.sys != null) data['sys'] = this.sys?.toJson();
//     data['dt_txt'] = this.dtTxt;
//     return data;
//   }
// }

// class Sys {
//   String? pod;

//   Sys({this.pod});

//   Sys.fromJson(Map<String, dynamic> json) {
//     if (json['pod'] is String) this.pod = json['pod'] as String;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['pod'] = this.pod;
//     return data;
//   }
// }

// class Rain {
//   double? threeH;

//   Rain({this.threeH});

//   Rain.fromJson(Map<String, dynamic> json) {
//     if (json['3h'] is double) this.threeH = json['3h'] as double;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['3h'] = this.threeH;
//     return data;
//   }
// }

// class Wind {
//   double? speed;
//   int? deg;
//   double? gust;

//   Wind({this.speed, this.deg, this.gust});

//   Wind.fromJson(Map<String, dynamic> json) {
//     if (json['speed'] is double) this.speed = json['speed'] as double;
//     if (json['deg'] is int) this.deg = json['deg'] as int;
//     if (json['gust'] is double) this.gust = json['gust'] as double;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['speed'] = this.speed;
//     data['deg'] = this.deg;
//     data['gust'] = this.gust;
//     return data;
//   }
// }

// class Clouds {
//   int? all;

//   Clouds({this.all});

//   Clouds.fromJson(Map<String, dynamic> json) {
//     if (json['all'] is int) this.all = json['all'] as int;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['all'] = this.all;
//     return data;
//   }
// }

// class Weather {
//   int? id;
//   String? main;
//   String? description;
//   String? icon;

//   Weather({this.id, this.main, this.description, this.icon});

//   Weather.fromJson(Map<String, dynamic> json) {
//     if (json['id'] is int) this.id = json['id'] as int;
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

// class Main {
//   double? temp;
//   double? feelsLike;
//   double? tempMin;
//   double? tempMax;
//   int? pressure;
//   int? seaLevel;
//   int? grndLevel;
//   int? humidity;
//   double? tempKf;

//   Main(
//       {this.temp,
//       this.feelsLike,
//       this.tempMin,
//       this.tempMax,
//       this.pressure,
//       this.seaLevel,
//       this.grndLevel,
//       this.humidity,
//       this.tempKf});

//   Main.fromJson(Map<String, dynamic> json) {
//     if (json['temp'] is double) this.temp = json['temp'] as double;
//     if (json['feels_like'] is double)
//       this.feelsLike = json['feels_like'] as double;
//     if (json['temp_min'] is double) this.tempMin = json['temp_min'] as double;
//     if (json['temp_max'] is double) this.tempMax = json['temp_max'] as double;
//     if (json['pressure'] is int) this.pressure = json['pressure'] as int;
//     if (json['sea_level'] is int) this.seaLevel = json['sea_level'] as int;
//     if (json['grnd_level'] is int) this.grndLevel = json['grnd_level'] as int;
//     if (json['humidity'] is int) this.humidity = json['humidity'] as int;
//     if (json['temp_kf'] is double) this.tempKf = json['temp_kf'] as double;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['temp'] = this.temp;
//     data['feels_like'] = this.feelsLike;
//     data['temp_min'] = this.tempMin;
//     data['temp_max'] = this.tempMax;
//     data['pressure'] = this.pressure;
//     data['sea_level'] = this.seaLevel;
//     data['grnd_level'] = this.grndLevel;
//     data['humidity'] = this.humidity;
//     data['temp_kf'] = this.tempKf;
//     return data;
//   }
// }
