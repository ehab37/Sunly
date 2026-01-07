import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sunly/core/models/weather_model.dart';
import 'package:sunly/core/utils/assets.dart';
import 'package:sunly/widgets/build_weather_info.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    String updatedAt = DateFormat("HH:mm").format(DateTime.parse(weather.date));
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.location_solid),
              SizedBox(width: 8),
              Text(
                weather.cityName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Updated at $updatedAt',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              weather.conditionIconUrl == null
                  ? Image.asset(AssetsData.kLogo, height: 64, width: 64)
                  : Image.network(
                      "https:${weather.conditionIconUrl}",
                      height: 64,
                      width: 64,
                    ),
              const SizedBox(width: 16),
              Text(
                '${weather.tempC.round()}°C',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            weather.conditionName,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildWeatherInfo(
                context,
                'Max Temp',
                '${weather.maxTempC.round()}°C',
              ),
              buildWeatherInfo(
                context,
                'Min Temp',
                '${weather.minTempC.round()}°C',
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
              buildWeatherInfo(context, 'Humidity', '${weather.humidity}%'),
            ],
          ),
        ],
      ),
    );
  }
}
