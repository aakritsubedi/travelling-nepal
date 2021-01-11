import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:travellingNepal/models/stories.dart';

class StoriesService {
  static String baseUrl = 'https://travellingnepal.al-ayan.com/public/api';

  static Future<List<Stories>> fetchAllStories() async {
    http.Response response = await http.get(baseUrl + '/stories');

    List stories = jsonDecode(response.body);
    List allStories = stories.map((story) {
      return Stories.fromJson(story);
    }).toList();

    return List.from(allStories.reversed);
  }

  static Future<List<Stories>> fetchHrsStories(hrs) async {
    http.Response response =
        await http.get(baseUrl + '/stories/lastHrsStories/' + hrs);

    List stories = jsonDecode(response.body);
    List lastHrsStories = stories.map((story) {
      return Stories.fromJson(story);
    }).toList();

    return List.from(lastHrsStories.reversed);
  }

  static Future<bool> addStories(Map data) async {
    http.Response response = await http.post(baseUrl + '/stories', body: {
      "caption": data['caption'],
      "uploadedBy": data['uploadedBy'],
      "location": data['location'],
      "coordinate": data['coordinate'],
      "filename": data['filename'],
      "imageBase64": data['imageBase64'],
      "type": data['type']
    });

    if(jsonDecode(response.body)['status'] == 1) {
      return true;
    }

    return false;
  }
}
