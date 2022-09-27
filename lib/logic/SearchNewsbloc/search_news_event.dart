part of 'search_news_bloc.dart';

abstract class SearchNewsEvent extends Equatable {
  const SearchNewsEvent();

  @override
  List<Object> get props => [];
}

class SearchNewsFetchEvent extends SearchNewsEvent {
  final String keyword;
  const SearchNewsFetchEvent({
    required this.keyword,
  });

  @override
  List<Object> get props => [keyword];
}
