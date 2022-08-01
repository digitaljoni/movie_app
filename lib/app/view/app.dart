import 'package:favorites_repository/favorites_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app/config/config.dart';
import 'package:movie_app/favorites/cubit/cubit.dart';
import 'package:movie_app/genres/cubit/genres_cubit.dart';

import 'package:movie_app/l10n/l10n.dart';
import 'package:movie_app/popular_movies/cubit/cubit.dart';
import 'package:movie_app/splash/splash.dart';

import 'package:movies_repository/movies_repository.dart';

class App extends StatelessWidget {
  const App({
    required this.moviesRepository,
    required this.favoritesRepository,
    super.key,
  });

  final MoviesRepository moviesRepository;
  final FavoritesRepository favoritesRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MoviesRepository>.value(
          value: moviesRepository,
        ),
        RepositoryProvider<FavoritesRepository>.value(
          value: favoritesRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PopularMoviesCubit>(
            create: (context) => PopularMoviesCubit(
              moviesRepository: moviesRepository,
            )..getPopularMovies(1),
          ),
          BlocProvider<GenresCubit>(
            create: (context) => GenresCubit(
              moviesRepository: moviesRepository,
            )..getGenres(),
          ),
          BlocProvider<FavoritesCubit>(
            create: (context) => FavoritesCubit(
              favoritesRepository: favoritesRepository,
            )..getCachedFavorites(),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultThemeData,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const SplashPage(),
    );
  }
}
