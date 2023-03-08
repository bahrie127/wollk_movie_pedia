import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wollk_movie_pedia/features/trending/data/datasources/trending_remote_datasource.dart';
import 'package:wollk_movie_pedia/features/trending/data/models/trending_response_model.dart';
import 'package:wollk_movie_pedia/features/trending/data/repositories/trending_repository_impl.dart';
import 'package:wollk_movie_pedia/features/trending/domain/repositories/repository.dart';

import 'trending_repository_impl_test.mocks.dart';

@GenerateMocks([TrendingRemoteDataSource])
void main() {
  late TrendingRepositoryImpl repository;
  late MockTrendingRemoteDataSource mockTrendingRemoteDataSource;

  setUp(() {
    mockTrendingRemoteDataSource = MockTrendingRemoteDataSource();
    repository =
        TrendingRepositoryImpl(remoteDataSource: mockTrendingRemoteDataSource);
  });

  String jsonString = '''
{
    "page": 1,
    "results": [
        {
            "adult": false,
            "backdrop_path": "/zWDMQX0sPaW2u0N2pJaYA8bVVaJ.jpg",
            "id": 631842,
            "title": "Knock at the Cabin",
            "original_language": "en",
            "original_title": "Knock at the Cabin",
            "overview": "While vacationing at a remote cabin, a young girl and her two fathers are taken hostage by four armed strangers who demand that the family make an unthinkable choice to avert the apocalypse. With limited access to the outside world, the family must decide what they believe before all is lost.",
            "poster_path": "/dm06L9pxDOL9jNSK4Cb6y139rrG.jpg",
            "media_type": "movie",
            "genre_ids": [
                27,
                9648,
                53
            ],
            "popularity": 3975.228,
            "release_date": "2023-02-01",
            "video": false,
            "vote_average": 6.559,
            "vote_count": 828
        }
    ],
    "total_pages": 1000,
    "total_results": 20000
}
''';

  final responseModel = TrendingResponseModel.fromJson(json.decode(jsonString));

  test('test trending repo impl get trending all', () async {
    when(mockTrendingRemoteDataSource.getTrendingAll())
        .thenAnswer((realInvocation) async {
      return responseModel;
    });
    //act
    final result = await repository.getTrendingAll();
    final resultList = result.getOrElse(
      () => [],
    );

    expect(
        resultList, responseModel.results!.map((e) => e.toEntity()).toList());
  });
}
