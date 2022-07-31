import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:movies_api/movies_api.dart';

part 'movie.g.dart';

/// {@template movie}
/// Movie Model, all parameters must be provided
/// {@endtemplate}
@immutable
@JsonSerializable()
class Movie {
  /// {@macro movie}
  const Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  /// Indicates if adult video
  final bool adult;

  /// Path for Background Image
  /// Added to: https://image.tmdb.org/t/p/w500/
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;

  /// List of genreIds for the movie
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;

  /// The id of the movie
  final int id;

  /// language in 2-letter ISO code
  @JsonKey(name: 'original_language')
  final String originalLanguage;

  /// original title
  @JsonKey(name: 'original_title')
  final String originalTitle;

  /// Short description of the movie
  final String overview;

  /// Popularity score
  final double popularity;

  /// Path for the poster
  /// Added to: https://image.tmdb.org/t/p/w500/
  @JsonKey(name: 'poster_path')
  final String posterPath;

  /// Release date
  @JsonKey(name: 'release_date')
  final String releaseDate;

  /// Title of the Movie
  final String title;

  /// Is video
  final bool video;

  /// Average vote score
  @JsonKey(name: 'vote_average')
  final double voteAverage;

  /// Number of Votes;

  @JsonKey(name: 'vote_count')
  final int voteCount;

  /// Deserializes the given [JsonMap] into a [Movie].
  static Movie fromJson(JsonMap json) => _$MovieFromJson(json);

  /// Converts this [Movie] into a [JsonMap].
  JsonMap toJson() => _$MovieToJson(this);

  @override
  bool operator ==(Object other) =>
      other is Movie && other.runtimeType == runtimeType && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
