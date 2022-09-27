import 'package:flutter_news/data/model/favorite_news.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveSorage {
  Future<Box<FavoriteNews>> init() async {
    Box<FavoriteNews> box = await Hive.openBox<FavoriteNews>('News');
    return box;
  }

  Future<List<FavoriteNews>>? getFavouriteNews() async {
    var box = await init();
    List<FavoriteNews> favoriteNews = box.values.toList();
    return favoriteNews;
  }

  Future<void> addFavouriteNews(FavoriteNews favoriteNews) async {
    var box = await init();
    box.add(favoriteNews);
  }

  Future<void> removeFavouriteNews(int id) async {
    var box = await init();
    return box.deleteAt(id);
  }
}
