import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class WeatherWebServies {
  static Future<Map<String, dynamic>> getFiveDaysWeather() async {
    try {
      final response = await http.get(Uri.parse(
          'http://api.openweathermap.org/data/2.5/forecast?id=292223&appid=079ff8432ae2a195b176c40347421c9c'));
      return json.decode(response.body);
    } catch (e) {
      if (kDebugMode) {
        print(
          e.toString(),
        );
      }
      return {};
    }
  }
}
