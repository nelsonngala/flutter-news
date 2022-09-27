part of 'health_news_bloc.dart';

abstract class HealthNewsState extends Equatable {
  const HealthNewsState();
}

class HealthNewsLoading extends HealthNewsState {
  @override
  List<Object?> get props => [];
}

class HealthNewsLoaded extends HealthNewsState {
  final News news;
  const HealthNewsLoaded({
    required this.news,
  });
  @override
  List<Object?> get props => [news];
}

class HealthNewsError extends HealthNewsState {
  final String error;
  const HealthNewsError({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
