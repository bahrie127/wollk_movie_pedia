import 'package:dartz/dartz.dart';

import 'package:wollk_movie_pedia/features/trending/domain/entities/trending.dart';
import 'package:wollk_movie_pedia/features/trending/domain/repositories/repository.dart';

class GetTrendingAll {

  final TrendingRepository repository;
  GetTrendingAll({
    required this.repository,
  });

  Future<Either<String, List<Trending>>> execute() {
    return repository.getTrendingAll();
  }
}
