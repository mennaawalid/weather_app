import 'package:weather_app/models/weather_model.dart';

import '../web_services/weather_web_service.dart';

class WeatherRepository {
  static Future<List<WeatherInfo>> getListOfWeather() async {
    final data = await WeatherWebServies.getFiveDaysWeather();

    final weatherData = Data.fromJson(data);

    return weatherData.weather!;
  }

  // static Future<Map<String, dynamic>?> getCityInfo() async {
  //   final data = await WeatherWebServies.getFiveDaysWeather();
  //   final weatherData = Data.fromJson(data);
  //   return weatherData.city!;
  // }
}



    // for (int i = 0; i < weatherData.weather!.length; i++) {
    //   for (int b = 1; b < weatherData.weather!.length; b++) {
    //     if (weatherData.weather![i].dt!.toStringAsFixed(5) !=
    //         weatherData.weather![b].dt!.toStringAsFixed(5)) {
    //       fiveDays.add(weatherData.weather![i]);
    //     }
    //   }
    // }
