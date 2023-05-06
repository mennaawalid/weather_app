import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'dart:async';

import '../repositories/weather_respository.dart';

class WeatherProvider with ChangeNotifier {
  List<WeatherInfo> _weatherList = [];

  Future<List<WeatherInfo>> getAllWeather() async {
    _weatherList = await WeatherRepository.getListOfWeather();
    notifyListeners();
    return _weatherList;
  }

  Future<List<WeatherInfo>> getDaysWeatherOnly() async {
    await getAllWeather();

    List<WeatherInfo> fiveDays = [];

    for (int i = 0; i < _weatherList.length - 1; i++) {
      if (_weatherList[i].dtTxt!.substring(1, 10) !=
          _weatherList[i + 1].dtTxt!.substring(1, 10)) {
        fiveDays.add(_weatherList[i]);
      }
    }
    return fiveDays;
  }

  List<WeatherInfo> findByDate(String date) {
    return _weatherList
        .where((element) =>
            element.dtTxt!.substring(0, 10) == date.substring(0, 10))
        .toList();
  }
}
