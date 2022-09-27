import 'package:flutter_news/data/model/news_model.dart';
import 'package:http/http.dart';

class GeneralNewsData {
  Future<News> getNews() async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=general&country=us&apiKey=1e26eea87ebb43ac8cb82061392c3f97'));
    News news = newsFromJson(response.body);
    return news;
  }
}

class EntertainmentNewsData {
  Future<News> getNews() async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=entertainment&country=us&apiKey=1e26eea87ebb43ac8cb82061392c3f97'));
    News news = newsFromJson(response.body);
    return news;
  }
}

class SportsNewsData {
  Future<News> getNews() async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=sports&country=us&apiKey=1e26eea87ebb43ac8cb82061392c3f97'));
    News news = newsFromJson(response.body);
    return news;
  }
}

class HealthNewsData {
  Future<News> getNews() async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=health&country=us&apiKey=1e26eea87ebb43ac8cb82061392c3f97'));
    News news = newsFromJson(response.body);
    return news;
  }
}

class BusinessNewsData {
  Future<News> getNews() async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=business&country=us&apiKey=1e26eea87ebb43ac8cb82061392c3f97'));
    News news = newsFromJson(response.body);
    return news;
  }
}

class SearchNewsData {
  Future<News>? getNews(String keyword) async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/everything?q=$keyword&apiKey=1e26eea87ebb43ac8cb82061392c3f97'));
    News news = newsFromJson(response.body);
    return news;
  }
}
