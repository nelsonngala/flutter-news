part of 'entartainment_news_bloc.dart';

abstract class EntartainmentNewsState extends Equatable {
  const EntartainmentNewsState();
}

class EntartainmentNewsLoading extends EntartainmentNewsState {
  @override
  List<Object?> get props => [];
}

class EntartainmentNewsLoaded extends EntartainmentNewsState {
  final News news;
  const EntartainmentNewsLoaded({
    required this.news,
  });
  @override
  List<Object?> get props => [news];
}

class EntartainmentNewsError extends EntartainmentNewsState {
  final String error;
  const EntartainmentNewsError({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
