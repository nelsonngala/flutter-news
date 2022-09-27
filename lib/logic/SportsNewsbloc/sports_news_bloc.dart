import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_news/data/model/news_model.dart';
import 'package:flutter_news/data/news%20api/news_api.dart';

part 'sports_news_event.dart';
part 'sports_news_state.dart';

class SportsNewsBloc extends Bloc<SportsNewsEvent, SportsNewsState> {
  final SportsNewsData _sportsNewsData;
  SportsNewsBloc(
    this._sportsNewsData,
  ) : super(SportsNewsLoading()) {
    on<SportsNewsFetchEvent>((event, emit) async {
      try {
        emit(SportsNewsLoading());
        News news = await _sportsNewsData.getNews();
        emit(SportsNewsLoaded(news: news));
      } catch (e) {
        emit(const SportsNewsError(
            error: 'Something went wrong, try again later.'));
      }
    });
    on<SportsNewsRefreshEvent>((event, emit) async {
      try {
        News news = await _sportsNewsData.getNews();
        emit(SportsNewsLoaded(news: news));
      } catch (e) {
        emit(const SportsNewsError(
            error: 'Something went wrong, try again later.'));
      }
    });
  }
}
