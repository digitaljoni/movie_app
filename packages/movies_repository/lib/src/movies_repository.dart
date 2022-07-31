import 'package:local_cache/local_cache.dart';
import 'package:movies_api/movies_api.dart';

const _genresKey = 'genres';
const _moviesKeyPrefix = 'movies';

/// {@template movies_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class MoviesRepository {
  /// {@macro movies_repository}
  MoviesRepository({
    required this.localCache,
    MoviesApi? moviesApi,
  }) : _moviesApiClient = moviesApi ?? MoviesApi(apiKey: '');

  final MoviesApi _moviesApiClient;

  /// localcache using hive pass a box LocalCache(box);
  final LocalCache localCache;

  /// retrieve cached popular movies
  Movies getCachedPopularMovies(int page) =>
      Movies.fromString(localCache.read('$_moviesKeyPrefix$page') as String);

  /// retrieve cached genres
  Genres getCachedGenres() =>
      Genres.fromString((localCache.read(_genresKey) ?? '') as String);

  /// get popular movies from API
  Future<Movies> getPopularMovies(int page) async {
    // check if page is stored in cache, return that instead

    final movies = await _moviesApiClient.getPopularMovies();

    await localCache.write('$_moviesKeyPrefix$page', movies.toString());

    return movies;
  }

  /// get movie genres from API
  Future<Genres> getGenres() async {
    final genres = await _moviesApiClient.getGenres();

    await localCache.write(_genresKey, genres.toString());

    return genres;
  }
}
