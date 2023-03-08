import 'package:dartz/dartz.dart';
import 'package:wollk_movie_pedia/features/trending/domain/entities/trending.dart';

abstract class TrendingRepository{
  Future<Either<String, List<Trending>>> getTrendingAll();
}