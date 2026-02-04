import 'package:equatable/equatable.dart';

import '../../models/forecast_day_model.dart';

/// Base class for forecast states
abstract class ForecastState extends Equatable {
  const ForecastState();

  @override
  List<Object?> get props => [];
}

/// Initial state when the cubit is created
class ForecastInitial extends ForecastState {
  const ForecastInitial();
}

/// State when forecast data is being loaded
class ForecastLoading extends ForecastState {
  const ForecastLoading();
}

/// State when forecast data is successfully loaded
class ForecastLoaded extends ForecastState {
  final List<ForecastDayModel> forecast;

  const ForecastLoaded(this.forecast);

  @override
  List<Object?> get props => [forecast];
}

/// State when an error occurs while fetching forecast
class ForecastError extends ForecastState {
  final String message;

  const ForecastError(this.message);

  @override
  List<Object?> get props => [message];
}
