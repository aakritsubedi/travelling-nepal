import 'dart:convert';

import 'package:http/http.dart' as http;

class AirportService {
  static String url = 'https://www.tiairport.com.np/flight_details_2';

  static Future<dynamic> getFlightInfo() async {
    http.Response response = await http.get(url);

    Map flightInfo = jsonDecode(response.body);
    return flightInfo['data'];
  }
}
