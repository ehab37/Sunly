import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiKeys {
  static final String apiKey = dotenv.env['WEATHER_API_KEY'] ?? 'No Key Found';
  static const String baseUrl = "http://api.weatherapi.com/v1";
}

const double kHorizontalPadding = 24;
const double kTopPadding = 16;
const double kBottomPadding = 30;
const double kBorderRadius = 12;
const Color kPrimaryColor = Color(0xff5cb6f9);
const kTransitionDuration = Duration(milliseconds: 400);
LinearGradient disco = const LinearGradient(
  colors: [Color(0xFF4568DC), Color(0xFFB06AB3)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
