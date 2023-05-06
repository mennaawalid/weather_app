import 'package:flutter/material.dart';

class Wind extends StatelessWidget {
  final String speed;
  final String date;

  const Wind({super.key, required this.date, required this.speed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          date.substring(11, 13),
          style: const TextStyle(fontSize: 20),
        ),
        const Icon(
          Icons.air,
          size: 25,
        ),
        Text(
          speed,
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
