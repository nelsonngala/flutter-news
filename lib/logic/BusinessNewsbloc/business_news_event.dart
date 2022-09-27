part of 'business_news_bloc.dart';

abstract class BusinessNewsEvent extends Equatable {
  const BusinessNewsEvent();

  @override
  List<Object> get props => [];
}

class BusinessNewsFetchEvent extends BusinessNewsEvent {
  const BusinessNewsFetchEvent();

  @override
  List<Object> get props => [];
}

class BusinessNewsRefreshEvent extends BusinessNewsEvent {
  const BusinessNewsRefreshEvent();

  @override
  List<Object> get props => [];
}
