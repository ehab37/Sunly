import 'package:flutter/material.dart';

Widget buildWeatherInfo(BuildContext context, String title, String value) {
  return Column(
    children: [
      Text(title, style: Theme.of(context).textTheme.bodyMedium),
      const SizedBox(height: 8),
      Text(value, style: Theme.of(context).textTheme.bodyLarge),
    ],
  );
}
