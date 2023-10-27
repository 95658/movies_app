import 'package:get_it/get_it.dart';
import 'package:movies_app/features/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/features/movies/data/repository/movie_repository.dart';
import 'package:movies_app/features/movies/domain/repository/base_movies_reository.dart';
import 'package:movies_app/features/movies/domain/usecases/ger_popular_movies.dart';
import 'package:movies_app/features/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_app/features/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/features/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:movies_app/features/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies_app/features/movies/presentation/controllers/movie_details_bloc.dart';
import 'package:movies_app/features/movies/presentation/controllers/movies_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerFactory(() => MoviesBloc(
          sl(),
          sl(),
          sl(),
        ));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));

    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));

    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
