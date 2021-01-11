import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travellingNepal/models/nearMe.dart';

class NearMeServices {
  static String baseUrl = 'https://travellingnepal.al-ayan.com/public/api';
  static Future<List<NearMe>> fetchAllNearMe() async {
    http.Response response = await http.get(baseUrl + '/nearme');

    List nearMe = jsonDecode(response.body);
    List allNearMe = nearMe.map((story) {
      return NearMe.fromJson(story);
    }).toList();

    return List.from(allNearMe);
  }
}
