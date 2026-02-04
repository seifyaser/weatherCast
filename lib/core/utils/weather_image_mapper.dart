import '../constants/app_constants.dart';

/// Utility class for mapping weather conditions to image assets
class WeatherImageMapper {
  // Private constructor to prevent instantiation
  WeatherImageMapper._();

  /// Maps weather condition string to corresponding image asset path
  static String getWeatherImage(String weatherCondition) {
    final condition = weatherCondition.toLowerCase();

    if (condition.contains('sunny') || condition.contains('clear')) {
      return 'assets/sunny.png';
    } else if (condition.contains('rain')) {
      return 'assets/rainy.png';
    } else if (condition.contains('cloud') || condition.contains('overcast')) {
      return 'assets/cloudy.png';
    } else if (condition.contains('thunderstorm') || condition.contains('thunder')) {
      return 'assets/thunderstorm.png';
    }

    return AppConstants.defaultWeatherImage;
  }
}
