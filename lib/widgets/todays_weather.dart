// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TodaysWeather extends StatelessWidget {
  final String cityName;
  final double temp;
  final String description;
  final String mainDesc;
  final String date;
  const TodaysWeather({
    super.key,
    required this.cityName,
    required this.temp,
    required this.description,
    required this.mainDesc,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    cityName.toUpperCase(),
                    style: const TextStyle(fontSize: 22, letterSpacing: 1.5),
                  ),
                  const Icon(
                    Icons.location_on_outlined,
                  ),
                ],
              ),
              Text(
                "${(temp - 273.15).toStringAsFixed(0)}\u00B0",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.2),
              ),
              Text(
                description,
                style: const TextStyle(fontSize: 20, letterSpacing: 1.5),
              ),
              Text(
                date.substring(0, 10),
                style: const TextStyle(fontSize: 20, letterSpacing: 1.5),
              ),
            ],
          ),
          Icon(
            mainDesc == 'Clear' ? Icons.sunny : Icons.wb_cloudy,
            color: mainDesc == 'Clear' ? Colors.amber : Colors.blue,
            size: MediaQuery.of(context).size.width * 0.37,
          ),
        ],
      ),
    );
  }
}
