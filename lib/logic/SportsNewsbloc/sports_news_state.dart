part of 'sports_news_bloc.dart';

abstract class SportsNewsState extends Equatable {
  const SportsNewsState();
}

class SportsNewsLoading extends SportsNewsState {
  @override
  List<Object?> get props => [];
}

class SportsNewsLoaded extends SportsNewsState {
  final News news;
  const SportsNewsLoaded({
    required this.news,
  });
  @override
  List<Object?> get props => [news];
}

class SportsNewsError extends SportsNewsState {
  final String error;
  const SportsNewsError({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
