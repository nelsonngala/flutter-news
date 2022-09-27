import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/data/model/news_model.dart';

import 'package:flutter_news/data/news%20api/news_api.dart';

part 'search_news_event.dart';
part 'search_news_state.dart';

class SearchNewsBloc extends Bloc<SearchNewsEvent, SearchNewsState> {
  final SearchNewsData _searchNewsData;
  SearchNewsBloc(
    this._searchNewsData,
  ) : super(SearchNewsInitial()) {
    on<SearchNewsEvent>((event, emit) async {
      try {
        if (event is SearchNewsFetchEvent) {
          emit(SearchNewsLoading());
          News? news = await _searchNewsData.getNews(event.keyword);
          if (news == null) {
            emit(const SearchNewsError(error: 'No news available'));
          } else {
            emit(SearchNewsLoaded(news: news));
          }
        }
      } catch (e) {
        emit(const SearchNewsError(
            error: 'Something went wrong, try again later. '));
      }
    });
  }
}
