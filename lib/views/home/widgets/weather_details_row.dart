import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/weather_model.dart';

/// Widget displaying weather details (sunrise, sunset, max/min temp)
class WeatherDetailsRow extends StatelessWidget {
  final WeatherModel weather;

  const WeatherDetailsRow({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Sunrise and Sunset Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDetailCard(
              icon: Icons.wb_sunny_outlined,
              label: 'Sunrise',
              value: weather.sunrise,
            ),
            _buildDetailCard(
              icon: Icons.wb_twilight,
              label: 'Sunset',
              value: weather.sunset,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Divider(
            color: Color.fromARGB(174, 158, 158, 158),
            thickness: 0.6,
            indent: 25,
            endIndent: 20,
          ),
        ),
        // Max and Min Temperature Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDetailCard(
              icon: Icons.thermostat_outlined,
              label: 'Max Temp',
              value: '${weather.maxTemp.toInt()}°C',
            ),
            _buildDetailCard(
              icon: Icons.thermostat_outlined,
              label: 'Min Temp',
              value: '${weather.minTemp.toInt()}°C',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Text(
              value,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
