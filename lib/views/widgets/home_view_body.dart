import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sunly/core/models/weather_model.dart';
import 'package:sunly/core/utils/assets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    String updatedAt = DateFormat("HH:mm").format(DateTime.parse(weather.date));
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(CupertinoIcons.location_solid),
              SizedBox(width: 8),
              Text(weather.cityName, style: TextStyle(fontSize: 30)),
            ],
          ),
          Text('updated at $updatedAt', style: TextStyle(fontSize: 24)),
          weather.conditionIconUrl == null
              ? Image.asset(
                  AssetsData.kLogo,
                  width: MediaQuery.of(context).size.width / 2,
                )
              : Image.network('https:${weather.conditionIconUrl!}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'MinTemp: ${weather.minTempC}',
                style: TextStyle(fontSize: 16),
              ),
              Text("${weather.tempC}°", style: TextStyle(fontSize: 50)),
              Text(
                'MaxTemp: ${weather.maxTempC}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Text(
            "feels like ${weather.feelsLikeC}°",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(height: 24),
          Text(
            weather.conditionName,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
