import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/weather_repository.dart';
import 'viewmodels/forecast_cubit.dart';
import 'viewmodels/weather_cubit.dart';
import 'views/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Create repository instance
    final weatherRepository = WeatherRepository(dio: Dio());

    return MultiBlocProvider(
      providers: [
        // Provide WeatherCubit for home screen
        BlocProvider<WeatherCubit>(
          create: (context) => WeatherCubit(repository: weatherRepository),
        ),
        // Provide ForecastCubit for forecast screen
        BlocProvider<ForecastCubit>(
          create: (context) => ForecastCubit(repository: weatherRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WeatherCast',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
