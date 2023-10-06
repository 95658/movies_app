import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/utils/base_use_case.dart';
import 'package:movies_app/features/movies/domain/repository/base_movies_reository.dart';

import '../entities/movie.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie> ,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future <Either<Failure,List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getPopularMovies();
  }
}