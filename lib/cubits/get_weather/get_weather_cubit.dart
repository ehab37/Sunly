import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunly/core/models/weather_model.dart';
import 'package:sunly/core/services/weather_service.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit({required this.weatherService}) : super(GetWeatherInitial());
  final WeatherService weatherService;

  Future<void> getCurrentWeather({required String cityName}) async {
    emit(GetWeatherLoading());
    try {
      final weather = await weatherService.getWeather(
        cityName: cityName,
      );
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('lastCity', cityName);
      emit(GetWeatherSuccess(weather: weather));
    } on Exception catch (e) {
      emit(GetWeatherFailure(errorMessage: e.toString()));
    }
  }

  void resetCubit() {
    emit(GetWeatherInitial());
  }
}
