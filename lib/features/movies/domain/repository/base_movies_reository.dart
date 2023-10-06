import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';
import 'package:movies_app/features/movies/domain/entities/movie_details.dart';
import 'package:movies_app/features/movies/domain/usecases/get_movie_details.dart';

abstract class BaseMoviesRepository {
  Future <Either<Failure,List<Movie>>> getNowPlayingMovies();
  Future <Either<Failure,List<Movie>>>  getPopularMovies();
  Future <Either<Failure,List<Movie>>>  getTopRatedMovies();
  Future <Either<Failure,MovieDetails>>  getMovieDetails(MovieDetailsParameters parameters);
}