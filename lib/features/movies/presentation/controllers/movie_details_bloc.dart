import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/features/movies/domain/entities/movie_details.dart';
import 'package:movies_app/features/movies/domain/entities/recommendation.dart';
import 'package:movies_app/features/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_app/features/movies/domain/usecases/get_recommendation_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase , this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsMessage: l.message,
          movieDetailsRequestState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetailsRequestState: RequestState.loaded,
          movieDetails: r,
        ),
      ),
    );
  }



  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit)async {
    final result =
        await getRecommendationUseCase(RecommendationParameters(event.id));

    result.fold(
          (l) => emit(
        state.copyWith(
          recommendationMessage: l.message,
          recommendationRequestState: RequestState.error,
        ),
      ),
          (r) => emit(
        state.copyWith(
          recommendationRequestState: RequestState.loaded,
          recommendation: r,
        ),
      ),
    );
  }
}
