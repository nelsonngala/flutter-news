part of 'business_news_bloc.dart';

abstract class BusinessNewsState extends Equatable {
  const BusinessNewsState();
}

class BusinessNewsLoading extends BusinessNewsState {
  @override
  List<Object?> get props => [];
}

class BusinessNewsLoaded extends BusinessNewsState {
  final News news;
  const BusinessNewsLoaded({
    required this.news,
  });
  @override
  List<Object?> get props => [];
}

class BusinessNewsError extends BusinessNewsState {
  final String error;
  const BusinessNewsError({
    required this.error,
  });
  @override
  List<Object?> get props => [];
}
