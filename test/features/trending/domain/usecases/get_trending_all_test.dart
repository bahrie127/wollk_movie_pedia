import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wollk_movie_pedia/features/trending/domain/entities/trending.dart';
import 'package:wollk_movie_pedia/features/trending/domain/repositories/repository.dart';
import 'package:wollk_movie_pedia/features/trending/domain/usecases/get_trending_all.dart';

import 'get_trending_all_test.mocks.dart';

@GenerateMocks([TrendingRepository])
void main() {
  late GetTrendingAll usecases;
  late MockTrendingRepository mockTrendingRepository;

  setUp(() {
    mockTrendingRepository = MockTrendingRepository();
    usecases = GetTrendingAll(repository: mockTrendingRepository);
  });

  test('get trending all usecases', () async {
    //arrange
    when(mockTrendingRepository.getTrendingAll())
        .thenAnswer((realInvocation) async {
      return const Right(<Trending>[]);
    });
    //act
    final result = await usecases.execute();

    //assert
    expect(result, const Right(<Trending>[]));
  });
}
