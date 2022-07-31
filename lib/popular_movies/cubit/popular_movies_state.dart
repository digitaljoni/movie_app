part of 'popular_movies_cubit.dart';

enum Status { initial, loading, success, failure }

/// {@template popular_movies}
/// PopularMoviesState description
/// {@endtemplate}
class PopularMoviesState extends Equatable {
  /// {@macro popular_movies}
  const PopularMoviesState({
    this.movies = Movies.empty,
    this.page = 0,
    this.status = Status.initial,
  });

  final Movies movies;
  final int page;
  final Status status;

  @override
  List<Object> get props => [
        movies,
        status,
        page,
      ];

  /// Creates a copy of the current PopularMoviesState with property changes
  PopularMoviesState copyWith({
    Movies? movies,
    int? page,
    Status? status,
  }) {
    return PopularMoviesState(
      movies: movies ?? this.movies,
      page: page ?? this.page,
      status: status ?? this.status,
    );
  }

  bool get isSuccess => status == Status.success;

  bool get isFailure => status == Status.failure;
}
