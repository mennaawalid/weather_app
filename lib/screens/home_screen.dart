import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';
import '../widgets/next_day_weather.dart';
import '../widgets/todays_weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider =
        Provider.of<WeatherProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: weatherProvider.getDaysWeatherOnly(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Flexible(
                    flex: 3,
                    child: TodaysWeather(
                      cityName: 'dubai',
                      description: snapshot.data![0].weather![0].description!,
                      mainDesc: snapshot.data![0].weather![0].main!,
                      temp: snapshot.data![0].main!['temp'].toDouble(),
                      date: snapshot.data![0].dtTxt!,
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Card(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.27,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return NextDayWeather(
                              mainDesc: snapshot.data![index].weather![0].main!,
                              temp: snapshot.data![index].main!['temp'],
                              date: snapshot.data![index].dtTxt!,
                            );
                          },
                          itemCount: snapshot.data!.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 15,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
      //  Column(
      // children: [
      //   Flexible(flex: 3, child: TodaysWeather()),
      //   ],
      // ),
    );
  }
}
