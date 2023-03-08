import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tv_series_state.dart';

class TvSeriesCubit extends Cubit<TvSeriesState> {
  TvSeriesCubit() : super(TvSeriesInitial());
}
