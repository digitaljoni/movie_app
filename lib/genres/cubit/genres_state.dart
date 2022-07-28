part of 'genres_cubit.dart';

enum GenresStatus { initial, loading, success, failure }

/// {@template genres}
/// GenresState description
/// {@endtemplate}
class GenresState extends Equatable {
  /// {@macro genres}
  const GenresState({
    this.genres = Genres.empty,
    this.status = GenresStatus.initial,
  });

  /// Object with a list of genres
  final Genres genres;

  /// Status of loading the genres
  final GenresStatus status;

  @override
  List<Object> get props => [genres];

  /// Creates a copy of the current GenresState with property changes
  GenresState copyWith({
    Genres? genres,
    GenresStatus? status,
  }) {
    return GenresState(
      genres: genres ?? this.genres,
      status: status ?? this.status,
    );
  }

  bool get isSuccess => status == GenresStatus.success;
}
