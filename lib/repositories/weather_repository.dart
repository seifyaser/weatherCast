import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import '../core/constants/app_constants.dart';
import '../models/forecast_day_model.dart';
import '../models/weather_model.dart';

/// Repository for weather data operations
/// Handles API calls and location services
class WeatherRepository {
  final Dio _dio;

  WeatherRepository({required Dio dio}) : _dio = dio;

  /// Fetches current weather by city name
  Future<WeatherModel> getWeatherByCity(String cityName) async {
    try {
      final response = await _dio.get(
        '${AppConstants.baseUrl}${AppConstants.forecastEndpoint}',
        queryParameters: {
          'key': AppConstants.apiKey,
          'q': cityName,
          'days': 1,
        },
      );

      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error']['message'] ??
          'Failed to fetch weather data. Please try again later.';
      throw Exception(errorMessage);
    }
  }

  /// Fetches current weather by geographic coordinates
  Future<WeatherModel> getWeatherByCoordinates(
    double latitude,
    double longitude,
  ) async {
    try {
      final response = await _dio.get(
        '${AppConstants.baseUrl}${AppConstants.forecastEndpoint}',
        queryParameters: {
          'key': AppConstants.apiKey,
          'q': '$latitude,$longitude',
          'days': 1,
        },
      );

      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error']['message'] ??
          'Failed to fetch weather data. Please try again later.';
      throw Exception(errorMessage);
    }
  }

  /// Fetches 7-day weather forecast for a city
  Future<List<ForecastDayModel>> getWeeklyForecast(String cityName) async {
    try {
      final response = await _dio.get(
        '${AppConstants.baseUrl}${AppConstants.forecastEndpoint}',
        queryParameters: {
          'key': AppConstants.apiKey,
          'q': cityName,
          'days': AppConstants.defaultForecastDays,
        },
      );

      if (response.data != null &&
          response.data['forecast'] != null &&
          response.data['forecast']['forecastday'] != null) {
        final forecastList = response.data['forecast']['forecastday'] as List;
        return forecastList
            .map((day) => ForecastDayModel.fromJson(day))
            .toList();
      }

      return [];
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error']['message'] ??
          'Failed to fetch forecast data. Please try again later.';
      throw Exception(errorMessage);
    }
  }

  /// Gets current device location
  /// Returns Position object with latitude and longitude
  /// Throws exception if location services are disabled or permission denied
  Future<Position> getCurrentLocation() async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled. Please enable them in settings.');
    }

    // Check location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied. Please grant permission to access your location.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
        'Location permissions are permanently denied. Please enable them in app settings.',
      );
    }

    // Get current position
    return await Geolocator.getCurrentPosition();
  }

  /// Fetches weather for current device location
  Future<WeatherModel> getWeatherByCurrentLocation() async {
    final position = await getCurrentLocation();
    return await getWeatherByCoordinates(
      position.latitude,
      position.longitude,
    );
  }
}
