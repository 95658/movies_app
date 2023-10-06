import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingMoviesState;
  final String nowPlayingMoviesMessage;

  final List<Movie> popularMovies;
  final RequestState popularMoviesState;
  final String popularMoviesMessage;

  final List<Movie> topRatedMovies;
  final RequestState topRatedMoviesState;
  final String topRatedMoviesMessage;

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingMoviesState,
        nowPlayingMoviesMessage,
        popularMovies,
        popularMoviesState,
        popularMoviesMessage,
        topRatedMovies,
        topRatedMoviesMessage,
        topRatedMoviesState,
      ];

  const MoviesState({
    this.topRatedMovies = const [],
    this.topRatedMoviesState = RequestState.loading,
    this.topRatedMoviesMessage = '',
    this.popularMovies = const [],
    this.popularMoviesMessage = '',
    this.popularMoviesState = RequestState.loading,
    this.nowPlayingMovies = const [],
    this.nowPlayingMoviesState = RequestState.loading,
    this.nowPlayingMoviesMessage = '',
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingMoviesState,
    String? nowPlayingMoviesMessage,
    List<Movie>? popularMovies,
    RequestState? popularMoviesState,
    String? popularMoviesMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedMoviesState,
    String? topRatedMoviesMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMoviesState:
          nowPlayingMoviesState ?? this.nowPlayingMoviesState,
      nowPlayingMoviesMessage:
          nowPlayingMoviesMessage ?? this.nowPlayingMoviesMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      popularMoviesMessage: popularMoviesMessage ?? this.popularMoviesMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      topRatedMoviesMessage:
          topRatedMoviesMessage ?? this.topRatedMoviesMessage,
    );
  }
}
