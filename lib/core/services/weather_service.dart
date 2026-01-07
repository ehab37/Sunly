import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:sunly/constants.dart';
import 'package:sunly/core/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      final response = await dio.get(
        "${ApiKeys.baseUrl}/forecast.json?key=${ApiKeys.apiKey}&q=$cityName&days=5",
      );
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      String errorMessage =
          e.response?.data['error']['message'] ?? 'opps! something went wrong';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to load weather data');
    }
  }
}
