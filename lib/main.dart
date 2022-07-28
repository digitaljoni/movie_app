import 'package:movie_app/bootstrap.dart';
import 'package:movie_app/config/config.dart';
import 'package:movies_api/movies_api.dart';

void main() {
  final moviesApi = MoviesApi(
    apiKey: Configurations.apiKey,
  );

  bootstrap(moviesApi: moviesApi);
}
