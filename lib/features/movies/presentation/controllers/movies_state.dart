import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingMoviesState;
  final String nowPlayingMoviesMessage;

  @override
  List<Object> get props => [nowPlayingMovies, nowPlayingMoviesState, nowPlayingMoviesMessage,];

  const MoviesState({
     this.nowPlayingMovies = const [],
     this.nowPlayingMoviesState =  RequestState.loading,
     this.nowPlayingMoviesMessage='',
  });
}