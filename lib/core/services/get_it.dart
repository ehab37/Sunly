import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sunly/core/services/weather_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<WeatherService>(WeatherService(dio: getIt<Dio>()));
}
