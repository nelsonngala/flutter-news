part of 'general_news_bloc.dart';

abstract class GeneralNewsState extends Equatable {
  const GeneralNewsState();
}

class GeneralNewsLoading extends GeneralNewsState {
  const GeneralNewsLoading();
  @override
  List<Object?> get props => [];
}

class GeneralNewsLoaded extends GeneralNewsState {
  final News news;
  const GeneralNewsLoaded({
    required this.news,
  });
  @override
  List<Object?> get props => [];
}

class GeneralNewsError extends GeneralNewsState {
  final String error;
  const GeneralNewsError({
    required this.error,
  });
  @override
  List<Object?> get props => [];
}
