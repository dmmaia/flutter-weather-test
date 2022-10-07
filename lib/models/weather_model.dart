import 'dart:convert';

getWeather(String obj) {
  var weatherMap = jsonDecode(obj);
  var weather = WeatherModel.fromJson(weatherMap);
  return weather;
}

class WeatherModel {
  double temp;
  double tempMin;
  double tempMax;
  String description;

  WeatherModel(
    this.temp,
    this.tempMin,
    this.tempMax,
    this.description,
  );

  WeatherModel.fromJson(Map<String, dynamic> json)
      : temp = json['main']['temp'],
        tempMin = json['main']['temp_min'],
        tempMax = json['main']['temp_max'],
        description = json['weather'][0]['description'];

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'tempMin': tempMin,
        'tempMax': tempMax,
        'description': description,
      };
}
