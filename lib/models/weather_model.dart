class Data {
  String? cod;
  int? message;
  int? cnt;
  Map<String, dynamic>? city;

  List<WeatherInfo>? weather;

  Data({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.city,
    required this.weather,
  });

  Data.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    city = json['city'];
    if (json['list'] != null) {
      weather = <WeatherInfo>[];
      json['list'].forEach((v) {
        weather!.add(WeatherInfo.fromJson(v));
      });
    }
  }
}

class WeatherInfo {
  int? dt;
  Map<String, dynamic>? main;
  List<Weather>? weather;
  Map<String, dynamic>? clouds;
  Map<String, dynamic>? wind;
  int? visibility;
  int? pop;
  Map<String, dynamic>? sys;
  String? dtTxt;

  WeatherInfo(
      {required this.dt,
      required this.main,
      required this.weather,
      required this.clouds,
      required this.wind,
      required this.visibility,
      required this.pop,
      required this.sys,
      required this.dtTxt});

  WeatherInfo.fromJson(Map<String, dynamic> json) {
    dt = json['dt'] ?? 0;
    main = json['main'] ?? {};
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    clouds = json['clouds'];
    wind = json['wind'];
    visibility = json['visibility'];
    pop = json['pop'];
    sys = json['sys'];
    dtTxt = json['dt_txt'];
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}
