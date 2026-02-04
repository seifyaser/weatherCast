import 'package:equatable/equatable.dart';

import '../../models/weather_model.dart';

/// Base class for weather states
abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

/// Initial state when the cubit is created
class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

/// State when weather data is being loaded
class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

/// State when weather data is successfully loaded
class WeatherLoaded extends WeatherState {
  final WeatherModel weather;

  const WeatherLoaded(this.weather);

  @override
  List<Object?> get props => [weather];
}

/// State when an error occurs while fetching weather
class WeatherError extends WeatherState {
  final String message;

  const WeatherError(this.message);

  @override
  List<Object?> get props => [message];
}
