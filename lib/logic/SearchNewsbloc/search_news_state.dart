part of 'search_news_bloc.dart';

abstract class SearchNewsState extends Equatable {
  const SearchNewsState();
}

class SearchNewsInitial extends SearchNewsState {
  @override
  List<Object?> get props => [];
}

class SearchNewsLoading extends SearchNewsState {
  @override
  List<Object?> get props => [];
}

class SearchNewsLoaded extends SearchNewsState {
  final News news;
  const SearchNewsLoaded({
    required this.news,
  });
  @override
  List<Object?> get props => [];
}

class SearchNewsError extends SearchNewsState {
  final String error;
  const SearchNewsError({
    required this.error,
  });

  @override
  List<Object?> get props => [];
}
