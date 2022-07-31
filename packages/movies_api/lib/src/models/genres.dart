import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:movies_api/movies_api.dart';

part 'genres.g.dart';

/// {@template genre}
/// Genre Model, contains name of Genre
/// {@endtemplate}
@immutable
@JsonSerializable()
class Genres {
  /// {@macro genre}
  const Genres({
    required this.genreList,
  });

  /// list of genre
  @JsonKey(name: 'genres')
  final List<Genre> genreList;

  /// Deserializes the given [JsonMap] into a [Genres].
  static Genres fromJson(JsonMap json) => _$GenresFromJson(json);

  /// Converts this [Genres] into a [JsonMap].
  JsonMap toJson() => _$GenresToJson(this);

  @override
  String toString() => jsonEncode(toJson());

  /// Converts the given [String?] into a [Genres].
  static Genres fromString(String? value) =>
      (value == null) ? Genres.empty : fromJson(jsonDecode(value) as JsonMap);

  /// represents an empty Genres
  static const empty = Genres(genreList: []);

  /// genres in map form <int, String>
  Map<int, String> get genreMap =>
      {for (var genre in genreList) genre.id: genre.name};

  // Map<int, String> _listToMap() {

  //   final _map = <int, String>{};

  //   for (final genre in genreList) {
  //     _map[genre.id] = genre.name;
  //   }

  //   return _map;
  // }
}
