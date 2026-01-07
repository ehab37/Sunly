import 'package:flutter/material.dart';
import 'package:sunly/core/models/weather_model.dart';
import 'package:sunly/widgets/build_forrest_item.dart';

class ForecastSection extends StatelessWidget {
  const ForecastSection({
    super.key,
    required this.weather,
    required this.isCelsius,
  });

  final WeatherModel weather;
  final bool isCelsius;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '5-Day Forecast',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: weather.dailyForecasts.length,
          itemBuilder: (context, index) {
            final forecast = weather.dailyForecasts[index];
            return buildForecastItem(context, forecast, isCelsius);
          },
        ),
      ],
    );
  }
}
