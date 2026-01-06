class WeatherModel {
  final double tempC;
  final double tempF;
  final String conditionName;
  final String conditionIconUrl;
  final int humidity;
  final double windSpeed;
  final double feelsLikeC;
  final double feelsLikeF;
  final double minTempC;
  final double minTempF;
  final double maxTempC;
  final double maxTempF;

  // final String day;

  WeatherModel({
    required this.tempC,
    required this.tempF,
    required this.conditionName,
    required this.conditionIconUrl,
    required this.humidity,
    required this.windSpeed,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.minTempC,
    required this.minTempF,
    required this.maxTempC,
    required this.maxTempF,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      tempC: json['docId'],
      tempF: json['medicineUsage'],
      conditionName: json['medicineName'],
      conditionIconUrl: json['frequency'],
      humidity: json['medicineNotes'],
      windSpeed: json['isReminderActive'],
      feelsLikeC: json['medicineTypes'],
      feelsLikeF: json['imageUrl'],
      minTempC: json['imageUrl'],
      minTempF: json['imageUrl'],
      maxTempC: json['imageUrl'],
      maxTempF: json['imageUrl'],
    );
  }
}
