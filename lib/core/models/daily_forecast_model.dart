class DailyForecast {
  final String date;
  final double maxTempC;
  final double minTempC;
  final double maxTempF;
  final double minTempF;
  final String conditionIconUrl;

  DailyForecast({
    required this.date,
    required this.maxTempC,
    required this.minTempC,
    required this.maxTempF,
    required this.minTempF,
    required this.conditionIconUrl,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    return DailyForecast(
      date: json['date'],
      maxTempC: json['day']['maxtemp_c'],
      minTempC: json['day']['mintemp_c'],
      maxTempF: json['day']['maxtemp_f'],
      minTempF: json['day']['mintemp_f'],
      conditionIconUrl: json['day']['condition']['icon'],
    );
  }
}
