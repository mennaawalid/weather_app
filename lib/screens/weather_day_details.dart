import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

import '../widgets/every_hour_weather.dart';
import '../widgets/todays_weather.dart';
import '../widgets/wind.dart';

class WeatherDayDetails extends StatelessWidget {
  static const routeName = '/one_day_weather_detail';

  const WeatherDayDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final date = ModalRoute.of(context)!.settings.arguments as String;
    final weatherData = Provider.of<WeatherProvider>(context, listen: false);
    final dayWeatherData = weatherData.findByDate(date);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          date.substring(0, 10),
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TodaysWeather(
              mainDesc: dayWeatherData[0].weather![0].main!,
              cityName: 'Dubai',
              date: date,
              description: dayWeatherData[0].weather![0].description!,
              temp: dayWeatherData[0].main!['temp'].toDouble(),
            ),
            Card(
              child: Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.029),
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Center(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return EveryHourWeather(
                        mainDesc: dayWeatherData[index].weather![0].main!,
                        temp: dayWeatherData[index].main!['temp'].toDouble(),
                        date: dayWeatherData[index].dtTxt!,
                      );
                    },
                    itemCount: dayWeatherData.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 15,
                      );
                    },
                  ),
                ),
              ),
            ),
            Card(
              child: Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.029),
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Center(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Wind(
                        date: dayWeatherData[index].dtTxt!,
                        speed: dayWeatherData[index].wind!['speed'].toString(),
                      );
                    },
                    itemCount: dayWeatherData.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 15,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
