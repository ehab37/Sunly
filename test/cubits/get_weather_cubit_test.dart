import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sunly/core/models/weather_model.dart';
import 'package:sunly/cubits/get_weather/get_weather_cubit.dart';
import 'package:sunly/core/services/weather_service.dart';

import '../mocks.mocks.dart';

void main() {
  group('GetWeatherCubit', () {
    late GetWeatherCubit getWeatherCubit;
    late WeatherService mockWeatherService;

    setUp(() {
      mockWeatherService = MockWeatherService();
      getWeatherCubit = GetWeatherCubit(weatherService: mockWeatherService);
    });

    tearDown(() {
      getWeatherCubit.close();
    });

    final weatherModel = WeatherModel.fromJson({
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
    });

    blocTest<GetWeatherCubit, GetWeatherState>(
      'emits [GetWeatherLoading, GetWeatherSuccess] when getCurrentWeather is called successfully',
      build: () {
        when(mockWeatherService.getWeather(cityName: 'London'))
            .thenAnswer((_) async => weatherModel);
        return getWeatherCubit;
      },
      act: (cubit) => cubit.getCurrentWeather(cityName: 'London'),
      expect: () => [
        isA<GetWeatherLoading>(),
        isA<GetWeatherSuccess>(),
      ],
    );

    blocTest<GetWeatherCubit, GetWeatherState>(
      'emits [GetWeatherLoading, GetWeatherFailure] when getCurrentWeather throws an exception',
      build: () {
        when(mockWeatherService.getWeather(cityName: 'London'))
            .thenThrow(Exception('Failed to load weather'));
        return getWeatherCubit;
      },
      act: (cubit) => cubit.getCurrentWeather(cityName: 'London'),
      expect: () => [
        isA<GetWeatherLoading>(),
        isA<GetWeatherFailure>(),
      ],
    );
  });
}
