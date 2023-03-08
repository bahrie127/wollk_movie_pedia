import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:wollk_movie_pedia/features/trending/data/datasources/trending_remote_datasource.dart';
import 'package:wollk_movie_pedia/features/trending/data/models/trending_response_model.dart';

import 'trending_remote_datasource_test.mocks.dart';

@GenerateMocks([], customMocks: [MockSpec<http.Client>(as: #MockHttpClient)])
void main() {
  late TrendingRemoteDataSourceImpl trendingRemoteDataSourceImpl;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    trendingRemoteDataSourceImpl =
        TrendingRemoteDataSourceImpl(client: mockHttpClient);
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

  test('trending remote datasource get all trending success', () async {
    when(mockHttpClient.get(Uri.parse(
            'https://api.themoviedb.org/3/trending/all/day?api_key=6d37959d5d8ea4dd3aee259761d87076')))
        .thenAnswer((realInvocation) async {
      return http.Response(jsonString, 200);
    });

    final result = await trendingRemoteDataSourceImpl.getTrendingAll();

    expect(result,
        equals(TrendingResponseModel.fromJson(json.decode(jsonString))));
  });
}
