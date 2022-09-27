import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/data/model/news_model.dart';
import 'package:flutter_news/data/news%20api/news_api.dart';

part 'entartainment_news_event.dart';
part 'entartainment_news_state.dart';

class EntartainmentNewsBloc
    extends Bloc<EntartainmentNewsEvent, EntartainmentNewsState> {
  final EntertainmentNewsData _entertainmentNewsData;
  EntartainmentNewsBloc(this._entertainmentNewsData)
      : super(EntartainmentNewsLoading()) {
    on<EntartainmentNewsEvent>((event, emit) async {
      try {
        if (event is EntartainmentNewsFetchEvent) {
          emit(EntartainmentNewsLoading());
          News news = await _entertainmentNewsData.getNews();
          emit(EntartainmentNewsLoaded(news: news));
        }
      } catch (e) {
        emit(const EntartainmentNewsError(
            error: 'Something went wrong, try again later.'));
      }
    });

    on<EntartainmentNewsRefreshEvent>((event, emit) async {
      try {
        News news = await _entertainmentNewsData.getNews();
        emit(EntartainmentNewsLoaded(news: news));
      } catch (e) {
        emit(const EntartainmentNewsError(
            error: 'Something went wrong, try again later.'));
      }
    });
  }
}
