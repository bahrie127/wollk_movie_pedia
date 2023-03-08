import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wollk_movie_pedia/features/trending/domain/usecases/get_trending_all.dart';

import '../../domain/entities/trending.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit({required this.usecases}) : super(TrendingInitial());

  final GetTrendingAll usecases;

  void getTrendingAll() async {
    emit(TrendingLoading());
    final result = await usecases.execute();
    result.fold(
      (error) => emit(TrendingFailed(message: error)),
      (data) => emit(TrendingLoaded(trendings: data)),
    );
  }
}
