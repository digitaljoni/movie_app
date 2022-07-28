import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_api/movies_api.dart';
import 'package:movies_repository/movies_repository.dart';
part 'genres_state.dart';

class GenresCubit extends Cubit<GenresState> {
  GenresCubit({
    required this.moviesRepository,
  }) : super(const GenresState());

  final MoviesRepository moviesRepository;

  Future<void> getGenres() async {
    emit(
      state.copyWith(
        status: GenresStatus.loading,
      ),
    );

    try {
      final genres = await moviesRepository.getGenres();

      emit(
        state.copyWith(
          genres: genres,
          status: GenresStatus.success,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: GenresStatus.failure));
    }
  }
}
