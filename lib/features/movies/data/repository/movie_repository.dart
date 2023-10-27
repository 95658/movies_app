import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/features/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';
import 'package:movies_app/features/movies/domain/entities/movie_details.dart';
import 'package:movies_app/features/movies/domain/entities/recommendation.dart';
import 'package:movies_app/features/movies/domain/repository/base_movies_reository.dart';
import 'package:movies_app/features/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_app/features/movies/domain/usecases/get_recommendation_usecase.dart';

class MovieRepository extends BaseMoviesRepository{
  
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource ;

  MovieRepository(this.baseMovieRemoteDataSource);


  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
   final result =  await baseMovieRemoteDataSource.getPopularMovies();
   try {
     return Right(result);
   } on ServerException catch (failure) {
     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
   }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result =  await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result =  await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters) async{
    final result =  await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendationMovie(RecommendationParameters parameters) async {
    final result =  await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  }