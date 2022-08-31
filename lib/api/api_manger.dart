import 'dart:convert';

import 'package:api/home/news_list.dart';
import 'package:api/model/news_response.dart';
import 'package:api/model/sources_response.dart';
import 'package:http/http.dart' as http;

class ApiManger {
  static const String BASE_URL = 'newsapi.org';
  static const String API_KEY = '9f796eb8070140f99d49bc8b15227983';
  static Future<SourcesResponse> getNewsSources() async {
    //https://newsapi.org/v2/top-headlines/sources?apiKey=9f796eb8070140f99d49bc8b15227983&category=sports
    var uri = Uri.https(BASE_URL, 'v2/top-headlines/sources', {
      'apikey': API_KEY,
      'category': 'sports',
    });

    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }
  static Future<NewsResponse>getNewLBySourceId(String,sourceId)async{
    var uri = Uri.https(BASE_URL, 'v2/everything', {
      'apikey': API_KEY,
      'sources': sourceId,
    });
    var response = await http.get(uri);
    var json=jsonDecode(response.body);
    var newsResponse=NewsResponse.fromJson(json);
    return newsResponse;
  }
}
