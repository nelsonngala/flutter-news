part of 'sports_news_bloc.dart';

abstract class SportsNewsEvent extends Equatable {
  const SportsNewsEvent();
}

class SportsNewsFetchEvent extends SportsNewsEvent {
  const SportsNewsFetchEvent();
  @override
  List<Object?> get props => [];
}

class SportsNewsRefreshEvent extends SportsNewsEvent {
  const SportsNewsRefreshEvent();
  @override
  List<Object?> get props => [];
}
