import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sunly/constants.dart';
import 'package:sunly/core/models/weather_model.dart';
import 'package:sunly/cubits/get_weather/get_weather_cubit.dart';
import 'package:sunly/cubits/temperature_unit/temperature_unit_cubit.dart';
import 'package:sunly/widgets/build_forrest_item.dart';
import 'package:sunly/widgets/build_weather_info.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    String updatedAt = DateFormat("HH:mm").format(DateTime.parse(weather.date));
    return BlocBuilder<TemperatureUnitCubit, TemperatureUnitState>(
      builder: (context, state) {
        final isCelsius = state.temperatureUnit == TemperatureUnit.celsius;
        final temp = isCelsius ? weather.tempC : weather.tempF;
        final maxTemp = isCelsius ? weather.maxTempC : weather.maxTempF;
        final minTemp = isCelsius ? weather.minTempC : weather.minTempF;
        final unit = isCelsius ? '°C' : '°F';

        return Padding(
          padding: const EdgeInsets.all(kHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<GetWeatherCubit>().resetCubit();
                    },
                    icon: const Icon(Icons.location_on),
                  ),
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
                  Image.network(
                    "https:${weather.conditionIconUrl}",
                    height: 64,
                    width: 64,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '${temp.round()}$unit',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                weather.conditionName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Feels like: ${isCelsius ? weather.feelsLikeC.round() : weather.feelsLikeF.round()}$unit',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),
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
                  buildWeatherInfo(context, 'Humidity', '${weather.humidity}%'),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                '5-Day Forecast',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: weather.dailyForecasts.length,
                  itemBuilder: (context, index) {
                    final forecast = weather.dailyForecasts[index];
                    return buildForecastItem(context, forecast, isCelsius);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
