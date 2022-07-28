import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:movies_api/movies_api.dart';

part 'genre.g.dart';

/// {@template genre}
/// Genre Model, contains name of Genre
/// {@endtemplate}
@immutable
@JsonSerializable()
class Genre {
  /// {@macro genre}
  const Genre({
    required this.id,
    required this.name,
  });

  /// id of genre
  final int id;

  /// name of genre
  final String name;

  /// Deserializes the given [JsonMap] into a [Genre].
  static Genre fromJson(JsonMap json) => _$GenreFromJson(json);

  /// Converts this [Genre] into a [JsonMap].
  JsonMap toJson() => _$GenreToJson(this);
}
