import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_news/data/local%20storage/hive_storage.dart';
import 'package:flutter_news/data/model/favorite_news.dart';

part 'favorite_news_event.dart';
part 'favorite_news_state.dart';

class FavoriteNewsBloc extends Bloc<FavoriteNewsEvent, FavoriteNewsState> {
  final HiveSorage _hiveSorage;
  FavoriteNewsBloc(
    this._hiveSorage,
  ) : super(FavoriteNewsInitial()) {
    on<FavouriteNewsGetEvent>((event, emit) async {
      List<FavoriteNews>? favoriteNews = await _hiveSorage.getFavouriteNews();
      if (favoriteNews!.isEmpty) {
        emit(FavoriteNewsInitial());
      } else {
        emit(FavoriteNewsAvailable(favouriteNews: favoriteNews));
      }
    });

    on<FavoriteNewsAddEvent>((event, emit) async {
      await _hiveSorage.addFavouriteNews(event.favoriteNews);
      add(FavouriteNewsGetEvent());
    });

    on<FavoriteNewsRemoveEvent>((event, emit) async {
      await _hiveSorage.removeFavouriteNews(event.id);
      add(FavouriteNewsGetEvent());
    });
  }
}
