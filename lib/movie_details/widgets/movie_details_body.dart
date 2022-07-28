import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie_details/movie_details.dart';
import 'package:movies_api/movies_api.dart';

/// {@template movie_details_body}
/// Body of the MovieDetailsPage.
///
/// Displays THe Movie Details
/// {@endtemplate}
class MovieDetailsBody extends StatelessWidget {
  /// {@macro movie_details_body}
  const MovieDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = context.read<Movie>();

    return Stack(
      children: [
        MovieBackdrop(
          id: movie.id,
          imagePath: movie.posterPath,
        ),
        const MovieDetailsInfo(),
      ],
    );
  }
}
