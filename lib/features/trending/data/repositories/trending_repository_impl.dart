import 'package:dartz/dartz.dart';

import 'package:wollk_movie_pedia/features/trending/domain/entities/trending.dart';
import 'package:wollk_movie_pedia/features/trending/domain/repositories/repository.dart';

import '../datasources/trending_remote_datasource.dart';

class TrendingRepositoryImpl implements TrendingRepository {
  TrendingRemoteDataSource remoteDataSource;
  TrendingRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<String, List<Trending>>> getTrendingAll() async {
    try {
      final result = await remoteDataSource.getTrendingAll();
      return Right(result.results!.map((e) => e.toEntity()).toList());
    } catch (e) {
      return const Left('server error');
    }
  }
}
