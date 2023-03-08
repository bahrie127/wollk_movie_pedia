part of 'trending_cubit.dart';

abstract class TrendingState extends Equatable {
  const TrendingState();

  @override
  List<Object> get props => [];
}

class TrendingInitial extends TrendingState {}

class TrendingLoading extends TrendingState {}

class TrendingLoaded extends TrendingState {
  final List<Trending> trendings;
  const TrendingLoaded({
    required this.trendings,
  });

  @override
  List<Object> get props => [trendings];
}

class TrendingFailed extends TrendingState {
  final String message;
  const TrendingFailed({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
