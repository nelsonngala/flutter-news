part of 'health_news_bloc.dart';

abstract class HealthNewsEvent extends Equatable {
  const HealthNewsEvent();
}

class HealthNewsFetchEvent extends HealthNewsEvent {
  const HealthNewsFetchEvent();

  @override
  List<Object> get props => [];
}

class HealthNewsRefreshEvent extends HealthNewsEvent {
  const HealthNewsRefreshEvent();

  @override
  List<Object> get props => [];
}
