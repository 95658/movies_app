import 'package:equatable/equatable.dart';

import 'geners.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final List<Genres> geners; 
  final int id;
  final String overView;
  final int runTime;
  final String relaseDate;
  final String title;
  final int voteAverage;

  const MovieDetails({
    required this.backdropPath,
    required this.geners,
    required this.id,
    required this.overView,
    required this.runTime,
    required this.relaseDate,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object> get props =>
      [
        backdropPath,
        geners,
        id,
        overView,
        runTime,
        relaseDate,
        title,
        voteAverage,
      ];

}