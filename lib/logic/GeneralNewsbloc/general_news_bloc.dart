import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_news/data/model/news_model.dart';
import 'package:flutter_news/data/news%20api/news_api.dart';

part 'general_news_event.dart';
part 'general_news_state.dart';

class GeneralNewsBloc extends Bloc<GeneralNewsEvent, GeneralNewsState> {
  final GeneralNewsData _generalNewsData;
  GeneralNewsBloc(
    this._generalNewsData,
  ) : super(const GeneralNewsLoading()) {
    on<GeneralNewsEvent>((event, emit) async {
      try {
        if (event is GeneralFetchEvent) {
          emit(const GeneralNewsLoading());
          News newsData = await _generalNewsData.getNews();
          emit(GeneralNewsLoaded(news: newsData));
        }
      } catch (e) {
        emit(const GeneralNewsError(
            error: 'Something went wrong, try again later.'));
      }
    });
    on<GeneralNewsRefreshEvent>((event, emit) async {
      try {
        News newsData = await _generalNewsData.getNews();
        emit(GeneralNewsLoaded(news: newsData));
      } catch (e) {
        emit(const GeneralNewsError(
            error: 'Something went wrong, try again later.'));
      }
    });
  }
}
