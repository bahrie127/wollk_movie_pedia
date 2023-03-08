import 'package:get_it/get_it.dart';
import 'package:wollk_movie_pedia/features/trending/data/datasources/trending_remote_datasource.dart';
import 'package:wollk_movie_pedia/features/trending/data/repositories/trending_repository_impl.dart';
import 'package:wollk_movie_pedia/features/trending/domain/repositories/repository.dart';
import 'package:wollk_movie_pedia/features/trending/domain/usecases/get_trending_all.dart';
import 'package:wollk_movie_pedia/features/trending/presentation/cubit/trending_cubit.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => TrendingCubit(usecases: locator()));

  locator.registerLazySingleton(() => GetTrendingAll(repository: locator()));

  locator.registerLazySingleton<TrendingRepository>(
      () => TrendingRepositoryImpl(remoteDataSource: locator()));

  locator.registerLazySingleton<TrendingRemoteDataSource>(
      () => TrendingRemoteDataSourceImpl(client: locator()));

  locator.registerLazySingleton(() => http.Client());
}
