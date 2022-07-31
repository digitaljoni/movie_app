import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:favorites_repository/favorites_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:local_cache/local_cache.dart';
import 'package:movie_app/app/app.dart';
import 'package:movie_app/config/config.dart';
import 'package:movies_api/movies_api.dart';
import 'package:movies_repository/movies_repository.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap() async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final moviesApi = MoviesApi(
    apiKey: Configurations.apiKey,
  );

  await Hive.initFlutter();

  final box = await Hive.openBox<dynamic>('movies');

  final localCache = LocalCache(box);

  final moviesRepository = MoviesRepository(
    moviesApi: moviesApi,
    localCache: localCache,
  );

  final favoritesRepository = FavoritesRepository(
    localCache: localCache,
  );

  await runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          App(
            moviesRepository: moviesRepository,
            favoritesRepository: favoritesRepository,
          ),
        ),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
