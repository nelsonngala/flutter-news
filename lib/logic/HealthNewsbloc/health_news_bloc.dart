import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_news/data/model/news_model.dart';
import 'package:flutter_news/data/news%20api/news_api.dart';

part 'health_news_event.dart';
part 'health_news_state.dart';

class HealthNewsBloc extends Bloc<HealthNewsEvent, HealthNewsState> {
  final HealthNewsData _healthNewsData;
  HealthNewsBloc(
    this._healthNewsData,
  ) : super(HealthNewsLoading()) {
    on<HealthNewsFetchEvent>((event, emit) async {
      try {
        emit(HealthNewsLoading());
        News news = await _healthNewsData.getNews();
        emit(HealthNewsLoaded(news: news));
      } catch (e) {
        emit(const HealthNewsError(
            error: 'Something went wrong, try again later.'));
      }
    });

    on<HealthNewsRefreshEvent>((event, emit) async {
      try {
        News news = await _healthNewsData.getNews();
        emit(HealthNewsLoaded(news: news));
      } catch (e) {
        emit(const HealthNewsError(
            error: 'Something went wrong, try again later.'));
      }
    });
  }
}
