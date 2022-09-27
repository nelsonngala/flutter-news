import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_news/data/model/news_model.dart';
import 'package:flutter_news/data/news%20api/news_api.dart';

part 'business_news_event.dart';
part 'business_news_state.dart';

class BusinessNewsBloc extends Bloc<BusinessNewsEvent, BusinessNewsState> {
  final BusinessNewsData _businessNewsData;
  BusinessNewsBloc(
    this._businessNewsData,
  ) : super(BusinessNewsLoading()) {
    on<BusinessNewsFetchEvent>((event, emit) async {
      try {
        emit(BusinessNewsLoading());
        News news = await _businessNewsData.getNews();
        emit(BusinessNewsLoaded(news: news));
      } catch (e) {
        emit(BusinessNewsError(error: '$e'));
      }
    });
    on<BusinessNewsRefreshEvent>((event, emit) async {
      try {
        News news = await _businessNewsData.getNews();
        emit(BusinessNewsLoaded(news: news));
      } catch (e) {
        emit(const BusinessNewsError(
            error: 'Something went wrong, try again later.'));
      }
    });
  }
}
