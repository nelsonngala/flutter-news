part of 'entartainment_news_bloc.dart';

abstract class EntartainmentNewsEvent extends Equatable {
  const EntartainmentNewsEvent();
}

class EntartainmentNewsFetchEvent extends EntartainmentNewsEvent {
  const EntartainmentNewsFetchEvent();
  @override
  List<Object?> get props => [];
}

class EntartainmentNewsRefreshEvent extends EntartainmentNewsEvent {
  const EntartainmentNewsRefreshEvent();
  @override
  List<Object?> get props => [];
}
