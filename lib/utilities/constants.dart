part 'api_token.dart';

class Constants {
  /// Get Api from https://openweathermap.org
  static const String weatherAppId = ApiToken.weatherAppId;
  static const String weatherBaseSchame = 'https://';

  static const String weatherBaseUrlDomain = 'api.openweathermap.org';
  static const String weatherCurientPath = '/data/2.5/weather';
  static const String weatherDailyPath = '/data/2.5/forecast';
  // static const String weatherDailyPath = '/data/2.5/forecast/daily';
  static const String weatherImagesPath = '/img/w/';
  static const String weatherImagesUrl =
      weatherBaseSchame + weatherBaseUrlDomain + weatherImagesPath;
}
