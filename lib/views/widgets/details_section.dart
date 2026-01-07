import 'package:flutter/material.dart';
import 'package:sunly/core/models/weather_model.dart';
import 'package:sunly/widgets/build_weather_info.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({
    super.key,
    required this.maxTemp,
    required this.unit,
    required this.minTemp,
    required this.weather,
  });

  final double maxTemp;
  final String unit;
  final double minTemp;
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildWeatherInfo(
              context,
              'Max Temp',
              '${maxTemp.round()}$unit',
            ),
            buildWeatherInfo(
              context,
              'Min Temp',
              '${minTemp.round()}$unit',
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildWeatherInfo(
              context,
              'Wind Speed',
              '${weather.windSpeed.round()} km/h',
            ),
            buildWeatherInfo(
              context,
              'Humidity',
              '${weather.humidity}%',
            ),
          ],
        ),
      ],
    );
  }
}