import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:wollk_movie_pedia/features/trending/data/models/trending_response_model.dart';

abstract class TrendingRemoteDataSource {
  Future<TrendingResponseModel> getTrendingAll();
}

class TrendingRemoteDataSourceImpl implements TrendingRemoteDataSource {
  final http.Client client;
  TrendingRemoteDataSourceImpl({
    required this.client,
  });
  @override
  Future<TrendingResponseModel> getTrendingAll() async {
    final response = await client.get(Uri.parse(
        'https://api.themoviedb.org/3/trending/all/day?api_key=6d37959d5d8ea4dd3aee259761d87076'));
    return TrendingResponseModel.fromJson(json.decode(response.body));
  }
}
