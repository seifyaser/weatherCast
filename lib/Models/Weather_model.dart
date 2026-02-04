/// Weather data model representing current weather information
class WeatherModel {
  final String cityName;
  final String date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  final String sunrise;
  final String sunset;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
    required this.sunrise,
    required this.sunset,
  });

  /// Creates a WeatherModel from JSON response
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'] as String,
      date: json['location']['localtime'] as String,
      temp: double.tryParse(
            json['forecast']['forecastday'][0]['day']['avgtemp_c'].toString(),
          ) ??
          0.0,
      maxTemp: double.tryParse(
            json['forecast']['forecastday'][0]['day']['maxtemp_c'].toString(),
          ) ??
          0.0,
      minTemp: double.tryParse(
            json['forecast']['forecastday'][0]['day']['mintemp_c'].toString(),
          ) ??
          0.0,
      weatherCondition:
          json['forecast']['forecastday'][0]['day']['condition']['text'] as String,
      sunrise: json['forecast']['forecastday'][0]['astro']['sunrise'] as String,
      sunset: json['forecast']['forecastday'][0]['astro']['sunset'] as String,
    );
  }

  /// Converts WeatherModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'cityName': cityName,
      'date': date,
      'temp': temp,
      'maxTemp': maxTemp,
      'minTemp': minTemp,
      'weatherCondition': weatherCondition,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  /// Creates a copy of this model with updated fields
  WeatherModel copyWith({
    String? cityName,
    String? date,
    double? temp,
    double? maxTemp,
    double? minTemp,
    String? weatherCondition,
    String? sunrise,
    String? sunset,
  }) {
    return WeatherModel(
      cityName: cityName ?? this.cityName,
      date: date ?? this.date,
      temp: temp ?? this.temp,
      maxTemp: maxTemp ?? this.maxTemp,
      minTemp: minTemp ?? this.minTemp,
      weatherCondition: weatherCondition ?? this.weatherCondition,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }

  @override
  String toString() {
    return 'WeatherModel(cityName: $cityName, temp: $temp°C, condition: $weatherCondition)';
  }
}
