import 'package:local_cache/local_cache.dart';
import 'package:movies_api/movies_api.dart';

const _favoritesKey = 'favorites';

/// {@template favorites_repository}
/// Facorites Repository
/// {@endtemplate}
class FavoritesRepository {
  /// {@macro favorites_repository}
  FavoritesRepository({
    required this.localCache,
  });

  /// localcache using hive pass a box LocalCache(box);
  final LocalCache localCache;

  /// get cached favorites
  Movies getCachedFavorites() => Movies.fromString(
        localCache.read(_favoritesKey) as String?,
      );

  /// get popular movies from API
  Future<Movies> updateFavorites(Movies movies) async {
    await localCache.write(_favoritesKey, movies.toString());
    return movies;
  }
}
