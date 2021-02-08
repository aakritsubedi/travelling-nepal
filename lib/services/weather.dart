import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travellingNepal/models/weather.dart';

class WeatherService {
  static String url = 'https://api.weatherbit.io/v2.0/current';

  static Future<dynamic> getWeatherInfo(lat, lon) async {
    String weatherURL = '$url?lat=$lat&lon=$lon&key=26c65c5417dd48ab97be99236acfe26f';
    http.Response response = await http.get(weatherURL);
    Map weatherInfo = jsonDecode(response.body);
    Weather weatherData = Weather.fromJson(weatherInfo['data'][0]); 

    return weatherData;
  }
}

