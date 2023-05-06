import 'package:flutter/material.dart';


class EveryHourWeather extends StatelessWidget {
  final double temp;
  final String mainDesc;
  final String date;

  const EveryHourWeather({
    super.key,
    required this.temp,
    required this.mainDesc,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          date.substring(11, 13),
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
    );
  }
}
