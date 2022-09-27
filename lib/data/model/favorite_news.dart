import 'package:hive/hive.dart';
part 'favorite_news.g.dart';

@HiveType(typeId: 1)
class FavoriteNews extends HiveObject {
  @HiveField(0)
  final String url;
  @HiveField(1)
  final String urlToImage;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String description;

  FavoriteNews({
    required this.url,
    required this.urlToImage,
    required this.title,
    required this.description,
  });
}
