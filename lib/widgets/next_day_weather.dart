import 'package:flutter/material.dart';

import '../screens/weather_day_details.dart';

class NextDayWeather extends StatelessWidget {
  final double temp;
  final String mainDesc;
  final String date;

  const NextDayWeather({
    super.key,
    required this.temp,
    required this.mainDesc,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(WeatherDayDetails.routeName, arguments: date);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            date.substring(0, 10),
            style: const TextStyle(fontSize: 20),
          ),
          Icon(
            mainDesc == 'Clear' ? Icons.sunny : Icons.wb_cloudy,
            color: mainDesc == 'Clear' ? Colors.amber : Colors.blue,
            size: 25,
          ),
          Text(
            "${(temp - 273.15).toStringAsFixed(0)}\u00B0",
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
