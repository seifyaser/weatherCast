import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/weather_repository.dart';
import 'weather_state.dart';

/// Cubit for managing home screen weather state
class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _repository;

  WeatherCubit({required WeatherRepository repository})
      : _repository = repository,
        super(const WeatherInitial());

  /// Fetches weather for current device location
  Future<void> fetchWeatherByLocation() async {
    try {
      emit(const WeatherLoading());
      final weather = await _repository.getWeatherByCurrentLocation();
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }

  /// Fetches weather for a specific city
  Future<void> fetchWeatherByCity(String cityName) async {
    if (cityName.trim().isEmpty) {
      emit(const WeatherError('Please enter a city name'));
      return;
    }

    try {
      emit(const WeatherLoading());
      final weather = await _repository.getWeatherByCity(cityName);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }

  /// Refreshes current weather data
  Future<void> refreshWeather() async {
    final currentState = state;
    if (currentState is WeatherLoaded) {
      // Refresh using the current city
      await fetchWeatherByCity(currentState.weather.cityName);
    } else {
      // Fallback to location-based weather
      await fetchWeatherByLocation();
    }
  }
}
