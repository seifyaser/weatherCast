import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../models/forecast_day_model.dart';

/// Widget for displaying a single forecast day item
class ForecastDayItem extends StatelessWidget {
  final ForecastDayModel day;

  const ForecastDayItem({
    super.key,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    final iconUrl = 'http:${day.conditionIcon}';

    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  DateFormat('EEE').format(DateTime.parse(day.date)),
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    iconUrl,
                    width: 35,
                    height: 30,
                  ),
                  Text(
                    day.conditionText,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Text(
                  '${day.avgTemp.round()}°',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                    ),
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: const Color.fromARGB(165, 255, 255, 255).withOpacity(0.2),
          endIndent: 30,
          indent: 30,
        ),
      ],
    );
  }
}
