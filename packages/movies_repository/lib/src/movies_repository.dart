import 'package:movies_api/movies_api.dart';

/// {@template movies_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class MoviesRepository {
  /// {@macro movies_repository}
  MoviesRepository({MoviesApi? moviesApi})
      : _moviesApiClient = moviesApi ?? MoviesApi(apiKey: '');

  final MoviesApi _moviesApiClient;

  /// get popular movies from API
  Future<Movies> getPopularMovies(int page) async {
    // check if page is stored in cache, return that instead

    return _moviesApiClient.getPopularMovies();
  }

  /// get movie genres from API
  Future<Genres> getGenres() async {
    // check if page is stored in cache, return that instead

    return _moviesApiClient.getGenres();
  }
}
