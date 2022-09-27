part of 'general_news_bloc.dart';

abstract class GeneralNewsEvent extends Equatable {
  const GeneralNewsEvent();
}

class GeneralFetchEvent extends GeneralNewsEvent {
  const GeneralFetchEvent();
  @override
  List<Object?> get props => [];
}

class GeneralNewsRefreshEvent extends GeneralNewsEvent {
  const GeneralNewsRefreshEvent();
  @override
  List<Object?> get props => [];
}
