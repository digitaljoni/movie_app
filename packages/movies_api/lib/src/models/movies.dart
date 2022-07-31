import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:movies_api/movies_api.dart';

part 'movies.g.dart';

/// {@template movies}
/// Movies Model, contains page number and list of movies
/// {@endtemplate}
@immutable
@JsonSerializable()
class Movies extends Equatable {
  /// {@macro movies}
  const Movies({
    required this.page,
    required this.movieList,
    required this.totalPages,
    required this.totalResults,
  });

  /// current page
  final int page;

  /// movie list in the current page
  @JsonKey(name: 'results')
  final List<Movie> movieList;

  /// total number of pages;
  @JsonKey(name: 'total_pages')
  final int totalPages;

  /// Total number of movies
  @JsonKey(name: 'total_results')
  final int totalResults;

  /// Deserializes the given [JsonMap] into a [Movies].
  static Movies fromJson(JsonMap json) => _$MoviesFromJson(json);

  /// Converts this [Movies] into a [JsonMap].
  JsonMap toJson() => _$MoviesToJson(this);

  @override
  String toString() => jsonEncode(toJson());

  /// Converts the given [String] into a [Movies].
  static Movies fromString(String value) =>
      fromJson(jsonDecode(value) as JsonMap);

  /// empty Movies object
  static const empty =
      Movies(page: 0, movieList: [], totalPages: 0, totalResults: 0);

  @override
  List<Object?> get props => [
        page,
        movieList,
        totalPages,
        totalResults,
      ];

  /// how many are in the movie list
  int get count => movieList.length;

  /// check if empty
  bool get isEmpty => this == empty;

  /// check if not empty
  bool get isNotEmpty => this != empty;
}
