import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/models/articles.dart';
import 'package:news_app/models/news.dart';

class NewsSevice {
  static NewsSevice _singleton = NewsSevice._internal();
  NewsSevice._internal();

  factory NewsSevice() {
    return _singleton;
  }

  static Future<List<Articles>?> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=8fe19c78dd704cae8d0fb93c41070cc4';

    final response = await http.get(Uri.parse(url));

    if (response.body.isNotEmpty) {
      final responseJson = json.decode(response.body);
      News news = News.fromJson(responseJson);
      return news.articles;
    }

    return null;
  }
}
