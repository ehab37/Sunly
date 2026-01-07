import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sunly/constants.dart';
import 'package:sunly/core/models/weather_model.dart';
import 'package:sunly/core/services/weather_service.dart';

import '../mocks.mocks.dart';

void main() {
  group('WeatherService', () {
    late WeatherService weatherService;
    late MockDio mockDio;

    setUpAll(() async {
      await dotenv.load(fileName: ".env");
    });

    setUp(() {
      mockDio = MockDio();
      weatherService = WeatherService(dio: mockDio);
    });

    final weatherData = {
      "location": {"name": "London"},
      "current": {
        "last_updated": "2024-05-21 10:30",
        "temp_c": 15.0,
        "temp_f": 59.0,
        "condition": {
          "text": "Sunny",
          "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
        },
        "wind_kph": 10.0,
        "humidity": 50,
        "feelslike_c": 14.0,
        "feelslike_f": 57.2
      },
      "forecast": {
        "forecastday": [
          {
            "day": {
              "maxtemp_c": 20.0,
              "mintemp_c": 10.0,
              "maxtemp_f": 68.0,
              "mintemp_f": 50.0,
              "condition": {"text": "Sunny"}
            },
            "date": "2024-05-21"
          }
        ]
      }
    };

    test('getCurrentWeather returns a WeatherModel on success', () async {
      final url =
          "${ApiKeys.baseUrl}/forecast.json?key=${ApiKeys.apiKey}&q=London&days=1";
      when(mockDio.get(url)).thenAnswer(
        (_) async => Response(
          data: weatherData,
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
        ),
      );

      final result = await weatherService.getCurrentWeather(cityName: 'London');

      expect(result, isA<WeatherModel>());
    });

    test('getCurrentWeather throws an exception on DioException', () async {
      final url =
          "${ApiKeys.baseUrl}/forecast.json?key=${ApiKeys.apiKey}&q=London&days=1";
      when(mockDio.get(url)).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: url),
          response: Response(
            data: {
              'error': {'message': 'City not found'}
            },
            statusCode: 400,
            requestOptions: RequestOptions(path: url),
          ),
        ),
      );

      expect(
        () async => await weatherService.getCurrentWeather(cityName: 'London'),
        throwsA(isA<Exception>()),
      );
    });

    test('getCurrentWeather throws a generic exception on other errors',
        () async {
      final url =
          "${ApiKeys.baseUrl}/forecast.json?key=${ApiKeys.apiKey}&q=London&days=1";
      when(mockDio.get(url)).thenThrow(Exception('Failed to connect'));

      expect(
        () async => await weatherService.getCurrentWeather(cityName: 'London'),
        throwsA(isA<Exception>()),
      );
    });
  });
}
