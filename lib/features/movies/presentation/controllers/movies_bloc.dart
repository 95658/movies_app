import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/features/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/features/movies/presentation/controllers/movies_event.dart';
import 'package:movies_app/features/movies/presentation/controllers/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent , MoviesState>{

  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase ;

  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MoviesState()){
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      emit (const MoviesState(nowPlayingMoviesState: RequestState.loaded));
      result.fold((l) => emit(MoviesState(
        nowPlayingMoviesState: RequestState.error,
        nowPlayingMoviesMessage: l.message,
      )), (r) => emit(MoviesState(
        nowPlayingMoviesState: RequestState.loaded,
        nowPlayingMovies: r,
      )));
    });
  }
}