import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/weather_repository.dart';
import 'forecast_state.dart';

/// Cubit for managing weekly forecast state
class ForecastCubit extends Cubit<ForecastState> {
  final WeatherRepository _repository;

  ForecastCubit({required WeatherRepository repository})
      : _repository = repository,
        super(const ForecastInitial());

  /// Fetches 7-day forecast for a specific city
  Future<void> fetchWeeklyForecast(String cityName) async {
    if (cityName.trim().isEmpty) {
      emit(const ForecastError('City name is required'));
      return;
    }

    try {
      emit(const ForecastLoading());
      final forecast = await _repository.getWeeklyForecast(cityName);
      
      if (forecast.isEmpty) {
        emit(const ForecastError('No forecast data available'));
        return;
      }
      
      emit(ForecastLoaded(forecast));
    } catch (e) {
      emit(ForecastError(e.toString()));
    }
  }
}
