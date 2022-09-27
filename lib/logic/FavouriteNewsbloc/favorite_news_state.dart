part of 'favorite_news_bloc.dart';

abstract class FavoriteNewsState extends Equatable {
  const FavoriteNewsState();
}

class FavoriteNewsInitial extends FavoriteNewsState {
  @override
  List<Object?> get props => [];
}

class FavoriteNewsAvailable extends FavoriteNewsState {
  final List<FavoriteNews> favouriteNews;
  const FavoriteNewsAvailable({
    required this.favouriteNews,
  });
  @override
  List<Object?> get props => [favouriteNews];
}
