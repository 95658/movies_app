import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/base_use_case.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/features/movies/domain/usecases/ger_popular_movies.dart';
import 'package:movies_app/features/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/features/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies_app/features/movies/presentation/controllers/movies_event.dart';
import 'package:movies_app/features/movies/presentation/controllers/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent , MoviesState>{

  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase ;
  final GetPopularMoviesUseCase getPopularMoviesUseCase ;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase ;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase, this.getTopRatedMoviesUseCase) : super(const MoviesState()){
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies) ;
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getNowPlayingMoviesUseCase(NoParameters());
    result.fold((l) => emit(
      state.copyWith(
        nowPlayingMoviesState: RequestState.error,
        nowPlayingMoviesMessage: l.message,
      ),), (r) => emit(

      state.copyWith(
        nowPlayingMoviesState: RequestState.loaded,
        nowPlayingMovies: r,
      ),));
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(NoParameters());
    result.fold((l) => emit(
      state.copyWith(
        popularMoviesState: RequestState.error,
        popularMoviesMessage: l.message,
      ),), (r) => emit(
      state.copyWith(
        popularMoviesState: RequestState.loaded,
        popularMovies: r,
      ),));
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(NoParameters());
    result.fold((l) => emit(
      state.copyWith(
        topRatedMoviesState: RequestState.error,
        topRatedMoviesMessage: l.message,
      ),), (r) => emit(
      state.copyWith(
        topRatedMoviesState: RequestState.loaded,
        topRatedMovies: r,
      ),));
  }
}