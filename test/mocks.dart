import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:sunly/core/services/weather_service.dart';

@GenerateMocks([WeatherService, Dio, HttpClientAdapter])
void main() {}
