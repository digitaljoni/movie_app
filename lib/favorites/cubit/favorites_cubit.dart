import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favorites_repository/favorites_repository.dart';
import 'package:movies_api/movies_api.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({
    required this.favoritesRepository,
  }) : super(const FavoritesState());

  final FavoritesRepository favoritesRepository;

  void getCachedFavorites() {
    emit(
      state.copyWith(
        status: FavoriteStatus.loading,
      ),
    );

    final movies = favoritesRepository.getCachedFavorites();

    emit(
      state.copyWith(
        movies: movies,
        status: FavoriteStatus.success,
      ),
    );
  }

  Future<void> toggleFavoriteMovie(Movie selectedMovie) async {
    emit(
      state.copyWith(
        status: FavoriteStatus.loading,
      ),
    );

    final favorites = state.movies;
    final movieList = [...favorites.movieList];

    if (movieList.contains(selectedMovie)) {
      // remove
      movieList.removeWhere((movie) => movie == selectedMovie);
    } else {
      // add
      movieList.add(selectedMovie);
    }

    //update movies

    final newFavorites = await favoritesRepository.updateFavorites(
      favorites.copyWith(
        movieList: movieList,
      ),
    );

    emit(
      state.copyWith(
        movies: newFavorites,
        status: FavoriteStatus.success,
      ),
    );
  }
}
