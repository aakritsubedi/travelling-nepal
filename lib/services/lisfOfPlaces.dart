import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travellingNepal/models/explorer.dart';

class ExplorerServices {
  static String baseUrl = 'https://travellingnepal.al-ayan.com/public/api';
  static Future<List<Explorer>> fetchAllPlaces() async {
    http.Response response = await http.get(baseUrl + '/places');
    List places = jsonDecode(response.body);
    List<Explorer> allPlaces = places.map((place) {
      return Explorer.fromJson(place);
    }).toList();

    return List.from(allPlaces);
  }
}
