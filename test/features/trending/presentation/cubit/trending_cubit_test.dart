import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wollk_movie_pedia/features/trending/domain/entities/trending.dart';
import 'package:wollk_movie_pedia/features/trending/domain/usecases/get_trending_all.dart';
import 'package:wollk_movie_pedia/features/trending/presentation/cubit/trending_cubit.dart';

import 'trending_cubit_test.mocks.dart';

@GenerateMocks([GetTrendingAll])
void main() {
  late MockGetTrendingAll mockGetTrendingAll;
  late TrendingCubit trendingCubit;

  setUp(() {
    mockGetTrendingAll = MockGetTrendingAll();
    trendingCubit = TrendingCubit(usecases: mockGetTrendingAll);
  });

  blocTest<TrendingCubit, TrendingState>(
    'cubit get trending all success',
    build: () {
      when(mockGetTrendingAll.execute()).thenAnswer((realInvocation) async {
        return const Right(<Trending>[]);
      });
      return trendingCubit;
    },
    act: (cubit) => cubit.getTrendingAll(),
    expect: () => [
      TrendingLoading(),
      const TrendingLoaded(trendings: <Trending>[]),
    ],
  );

  blocTest<TrendingCubit, TrendingState>(
    'cubit get trending all faled',
    build: () {
      when(mockGetTrendingAll.execute()).thenAnswer((realInvocation) async {
        return const Left('server error');
      });
      return trendingCubit;
    },
    act: (cubit) => cubit.getTrendingAll(),
    expect: () => [
      TrendingLoading(),
      const TrendingFailed(message: 'server error'),
    ],
  );
}
