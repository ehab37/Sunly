import 'package:sunly/core/models/daily_forecast_model.dart';

class WeatherModel {
  final String cityName;
  final String date;
  final double tempC;
  final double tempF;
  final String conditionName;
  final String? conditionIconUrl;
  final int humidity;
  final double windSpeed;
  final double feelsLikeC;
  final double feelsLikeF;
  final double minTempC;
  final double minTempF;
  final double maxTempC;
  final double maxTempF;
  final List<DailyForecast> dailyForecasts;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.tempC,
    required this.tempF,
    required this.conditionName,
    this.conditionIconUrl,
    required this.humidity,
    required this.windSpeed,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.minTempC,
    required this.minTempF,
    required this.maxTempC,
    required this.maxTempF,
    required this.dailyForecasts,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: json['current']['last_updated'],
      tempC: json['current']['temp_c'],
      tempF: json['current']['temp_f'],
      conditionName: json['current']['condition']['text'],
      conditionIconUrl: json['current']['condition']['icon'],
      humidity: json['current']['humidity'],
      windSpeed: json['current']['wind_kph'],
      feelsLikeC: json['current']['feelslike_c'],
      feelsLikeF: json['current']['feelslike_f'],
      minTempC: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      minTempF: json['forecast']['forecastday'][0]['day']['mintemp_f'],
      maxTempC: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      maxTempF: json['forecast']['forecastday'][0]['day']['maxtemp_f'],
      dailyForecasts: (json['forecast']['forecastday'] as List)
          .map((day) => DailyForecast.fromJson(day))
          .toList(),
    );
  }
}
