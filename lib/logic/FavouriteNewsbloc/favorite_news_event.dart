part of 'favorite_news_bloc.dart';

abstract class FavoriteNewsEvent extends Equatable {
  const FavoriteNewsEvent();
}

class FavouriteNewsGetEvent extends FavoriteNewsEvent {
  // const FavouriteNewsGetEvent();

  @override
  List<Object?> get props => [];
}

class FavoriteNewsAddEvent extends FavoriteNewsEvent {
  final FavoriteNews favoriteNews;
  const FavoriteNewsAddEvent({
    required this.favoriteNews,
  });

  @override
  List<Object?> get props => [favoriteNews];
}

class FavoriteNewsRemoveEvent extends FavoriteNewsEvent {
  final int id;
  const FavoriteNewsRemoveEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
