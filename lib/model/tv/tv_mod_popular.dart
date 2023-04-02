import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_mod_popular.freezed.dart';

part 'tv_mod_popular.g.dart';

@freezed
class PopularTVModel with _$PopularTVModel {
  const factory PopularTVModel({
    int? page,
    List<Results>? results,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
  }) = _PopularTVModel;

  factory PopularTVModel.fromJson(Map<String, dynamic> json) =>
      _$PopularTVModelFromJson(json);
}

@freezed
class Results with _$Results {
  const factory Results(
      {@JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'first_air_date') String? firstAirDate,
      @JsonKey(name: 'genre_ids') required List<int>? genreIds,
      required int? id,
      required String? name,
      @JsonKey(name: 'origin_country') required List<String>? originCountry,
      @JsonKey(name: 'original_language') required String? originalLanguage,
      @JsonKey(name: 'original_name') required String? originalName,
      required String? overview,
      required double? popularity,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'vote_average') required double? voteAverage,
      @JsonKey(name: 'vote_count') int? voteCount}) = _Results;

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}
