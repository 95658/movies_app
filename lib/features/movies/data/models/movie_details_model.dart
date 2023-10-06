import 'package:movies_app/features/movies/data/models/geners.dart';
import 'package:movies_app/features/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.geners,
    required super.id,
    required super.overView,
    required super.runTime,
    required super.relaseDate,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json){
    return MovieDetailsModel(
      backdropPath: json['backdrop_path'],
      geners: List<GenersModel>.from(json['genres'].map((e) => GenersModel.fromJson(e))),
      id: json['id'],
      overView: json['overview'],
      runTime: json['runtime'],
      relaseDate: json['release_date'],
      title: json['title'],
      voteAverage: json['vote_average'],
    );
  }
}
