import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WheaterService {
  Future<WeatherModel?> getWheaters() async {
    try {
      var url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&units=metric&appid=6b389bd41c456dd2236b304f7d2dab8f");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        WeatherModel _model = getWeather(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
