import 'package:flutter/material.dart';
import 'package:movie_app/common/common.dart';
import 'package:movie_app/popular_movies/cubit/cubit.dart';
import 'package:movie_app/popular_movies/popular_movies.dart';

/// {@template popular_movies_body}
/// Body of the PopularMoviesPage.
///
/// Add what it does
/// {@endtemplate}
class PopularMoviesBody extends StatelessWidget {
  /// {@macro popular_movies_body}
  const PopularMoviesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Popular',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: (state.isSuccess)
                  ? PopularMoviesList(
                      movies: state.movies,
                    )
                  : const Loading(),
            ),
          ],
        );
      },
    );
  }
}
