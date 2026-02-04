/// Forecast day model representing a single day's forecast data
class ForecastDayModel {
  final String date;
  final double avgTemp;
  final double maxTemp;
  final double minTemp;
  final String conditionText;
  final String conditionIcon;

  ForecastDayModel({
    required this.date,
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.conditionText,
    required this.conditionIcon,
  });

  /// Creates a ForecastDayModel from JSON response
  factory ForecastDayModel.fromJson(Map<String, dynamic> json) {
    return ForecastDayModel(
      date: json['date'] as String,
      avgTemp: double.tryParse(json['day']['avgtemp_c'].toString()) ?? 0.0,
      maxTemp: double.tryParse(json['day']['maxtemp_c'].toString()) ?? 0.0,
      minTemp: double.tryParse(json['day']['mintemp_c'].toString()) ?? 0.0,
      conditionText: json['day']['condition']['text'] as String,
      conditionIcon: json['day']['condition']['icon'] as String,
    );
  }

  /// Converts ForecastDayModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'avgTemp': avgTemp,
      'maxTemp': maxTemp,
      'minTemp': minTemp,
      'conditionText': conditionText,
      'conditionIcon': conditionIcon,
    };
  }

  @override
  String toString() {
    return 'ForecastDayModel(date: $date, avgTemp: $avgTemp°C, condition: $conditionText)';
  }
}
