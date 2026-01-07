import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sunly/core/models/daily_forecast_model.dart';

Widget buildForecastItem(
  BuildContext context,
  DailyForecast forecast,
  bool isCelsius,
) {
  final maxTemp = isCelsius ? forecast.maxTempC : forecast.maxTempF;
  final minTemp = isCelsius ? forecast.minTempC : forecast.minTempF;
  final unit = isCelsius ? '°C' : '°F';
  final date = DateTime.parse(forecast.date);
  final day = DateFormat('E').format(date);

  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(day, style: Theme.of(context).textTheme.bodyLarge),
          Image.network(
            "https:${forecast.conditionIconUrl}",
            height: 40,
            width: 40,
          ),
          Text(
            'H: ${maxTemp.round()}$unit',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            'L: ${minTemp.round()}$unit',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    ),
  );
}
