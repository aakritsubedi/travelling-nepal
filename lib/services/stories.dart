import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:travellingNepal/models/stories.dart';

class StoriesService {
  static String baseUrl = 'https://travellingnepal.al-ayan.com/public/api';

  static Future<List<Stories>> fetchAllStories () async {
    http.Response response = await http.get(
      baseUrl+'/stories' 
    );

    List stories = jsonDecode(response.body); 
    List allStories = stories.map((story) {
      return Stories.fromJson(story);
    }).toList();

    return allStories;
  }

  static Future<List<Stories>> fetchHrsStories (hrs) async {
    http.Response response = await http.get(
      baseUrl+'/stories/lastHrsStories/'+hrs 
    );

    List stories = jsonDecode(response.body); 
    List lastHrsStories = stories.map((story) {
      return Stories.fromJson(story);
    }).toList();

    return lastHrsStories;
  }

}