import 'package:movies_app/features/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    super.backdropPath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        backdropPath: json['backdrop_path'] ?? '/fm6KqXpk3M2HVveHwCrBSSBaO0V.jpg',
        id: json['id'],
      );
}
