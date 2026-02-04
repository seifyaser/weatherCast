import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../core/utils/weather_image_mapper.dart';
import '../../viewmodels/forecast_cubit.dart';
import '../../viewmodels/forecast_state.dart';
import '../widgets/background_gradients.dart';
import 'widgets/forecast_day_item.dart';

/// Screen displaying 7-day weather forecast
class ForecastScreen extends StatefulWidget {
  final String cityName;

  const ForecastScreen({
    super.key,
    required this.cityName,
  });

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch forecast on screen load
    context.read<ForecastCubit>().fetchWeeklyForecast(widget.cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Stack(
        children: [
          const BackgroundGradient4(),
          const BackgroundGradient2(),
          const BackgroundGradient1(),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(
              decoration: const BoxDecoration(color: Colors.transparent),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 85),
                        child: Row(
                          children: [
                            Container(
                              width: 29,
                              height: 35,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Back',
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<ForecastCubit, ForecastState>(
                        builder: (context, state) {
                          if (state is ForecastLoaded && state.forecast.isNotEmpty) {
                            final weatherImage = WeatherImageMapper.getWeatherImage(
                              state.forecast[0].conditionText,
                            );
                            return Image.asset(
                              weatherImage,
                              width: 155,
                              height: 120,
                              fit: BoxFit.cover,
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Icon(
                      MdiIcons.calendarMonthOutline,
                      size: 40,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "This Week",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<ForecastCubit, ForecastState>(
                  builder: (context, state) {
                    if (state is ForecastLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 18, 79, 183),
                        ),
                      );
                    }

                    if (state is ForecastError) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.error_outline,
                                color: Colors.red,
                                size: 60,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                state.message,
                                style: const TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<ForecastCubit>()
                                      .fetchWeeklyForecast(widget.cityName);
                                },
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    if (state is ForecastLoaded) {
                      return ListView.builder(
                        itemCount: state.forecast.length,
                        itemBuilder: (context, index) {
                          return ForecastDayItem(day: state.forecast[index]);
                        },
                      );
                    }

                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 18, 79, 183),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
