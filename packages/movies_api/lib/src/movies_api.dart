import 'package:dio/dio.dart';
import 'package:movies_api/src/models/genres.dart';
import 'package:movies_api/src/models/movies.dart';

/// Exception thrown if popular moview fetch is a failure
class PopularMovieFetchFailure implements Exception {}

/// Exception thrown if genre fetch is a failure
class GenreFetchFailure implements Exception {}

/// {@template movies_api}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class MoviesApi {
  /// {@macro movies_api}
  MoviesApi({
    required this.apiKey,
    Dio? dioClient,
    String? baseUrl,
  })  : _dioClient = dioClient ?? Dio(),
        _baseUrl = baseUrl ?? 'https://api.themoviedb.org/3' {
    _dioClient
      ..options.baseUrl = _baseUrl
      ..options.responseType = ResponseType.json;
  }

  /// Api Key of MovieDb
  final String apiKey;

  final Dio _dioClient;
  final String _baseUrl;

  /// Get popular movies from API
  Future<Movies> getPopularMovies({int page = 1}) async {
    final moviesResponse = await _dioClient.get<dynamic>(
      '/movie/popular',
      queryParameters: {
        'api_key': apiKey,
        'language': 'en_US',
        'page': page,
      },
    );

    if (moviesResponse.statusCode != 200) {
      throw PopularMovieFetchFailure();
    }

    return Movies.fromJson(moviesResponse.data as Map<String, dynamic>);
  }

  /// Get genres from API
  Future<Genres> getGenres() async {
    final genreResponse = await _dioClient.get<dynamic>(
      '/genre/movie/list',
      queryParameters: {
        'api_key': apiKey,
      },
    );

    if (genreResponse.statusCode != 200) {
      throw GenreFetchFailure();
    }

    return Genres.fromJson(genreResponse.data as Map<String, dynamic>);
  }
}
