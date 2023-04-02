import 'package:freezed_annotation/freezed_annotation.dart';

part 'mod_popular_movies.freezed.dart';

part 'mod_popular_movies.g.dart';

@freezed
class PopularMoviesModel with _$PopularMoviesModel {
  const factory PopularMoviesModel(
          {required int? page,
          required List<Results>? results,
          @JsonKey(name: 'total_pages') required int? totalPages,
          @JsonKey(name: 'total_results') required int? totalResults}) =
      _PopularMoviesModel;

  factory PopularMoviesModel.fromJson(Map<String, Object?> json) =>
      _$PopularMoviesModelFromJson(json);
}

@freezed
class Results with _$Results {
  const factory Results(
      {required bool? adult,
      @JsonKey(name: 'backdrop_path') required String? backdropPath,
      @JsonKey(name: 'genre_ids') required List<int>? genreIds,
      required int? id,
      @JsonKey(name: 'original_language') required String? originalLanguage,
      @JsonKey(name: 'original_title') required String? originalTitle,
      required String? overview,
      required double? popularity,
      @JsonKey(name: 'poster_path') required String? posterPath,
      @JsonKey(name: 'release_date') required String? releaseDate,
      required String? title,
      required bool? video,
      @JsonKey(name: 'vote_average') required double? voteAverage,
      @JsonKey(name: 'vote_count') required int? voteCount}) = _Results;

  factory Results.fromJson(Map<String, Object?> json) =>
      _$ResultsFromJson(json);
}
