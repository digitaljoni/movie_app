import 'package:flutter/material.dart';
import 'package:movie_app/common/common.dart';
import 'package:movie_app/favorites/cubit/cubit.dart';

/// {@template favorites_body}
/// Body of the FavoritesPage.
///
/// Add what it does
/// {@endtemplate}
class FavoritesBody extends StatelessWidget {
  /// {@macro favorites_body}
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Favorites',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: (state.movies.isNotEmpty)
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
