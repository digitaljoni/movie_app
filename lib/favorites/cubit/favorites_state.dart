part of 'favorites_cubit.dart';

enum FavoriteStatus { initial, loading, success, failure }

/// {@template favorites}
/// FavoritesState description
/// {@endtemplate}
class FavoritesState extends Equatable {
  /// {@macro favorites}
  const FavoritesState({
    this.movies = Movies.empty,
    this.status = FavoriteStatus.initial,
  });

  final Movies movies;
  final FavoriteStatus status;

  @override
  List<Object> get props => [
        movies,
        status,
      ];

  /// Creates a copy of the current FavoritesState with property changes
  FavoritesState copyWith({
    Movies? movies,
    FavoriteStatus? status,
  }) {
    return FavoritesState(
      movies: movies ?? this.movies,
      status: status ?? this.status,
    );
  }
}
