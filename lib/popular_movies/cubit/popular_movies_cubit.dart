import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_api/movies_api.dart';
import 'package:movies_repository/movies_repository.dart';
part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit({
    required this.moviesRepository,
  }) : super(const PopularMoviesState());

  final MoviesRepository moviesRepository;

  Future<void> getPopularMovies(int page) async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );

    try {
      final movies = await moviesRepository.getPopularMovies(page);

      emit(
        state.copyWith(
          page: page,
          movies: movies,
          status: Status.success,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
