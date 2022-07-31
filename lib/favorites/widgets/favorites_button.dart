import 'package:flutter/material.dart';
import 'package:movie_app/config/config.dart';
import 'package:movie_app/favorites/cubit/cubit.dart';
import 'package:movies_api/movies_api.dart';

class FavoritesButton extends StatelessWidget {
  const FavoritesButton({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        final cubit = context.read<FavoritesCubit>();

        final isSelected = state.movies.movieList.contains(movie);

        return IconButton(
          onPressed: () {
            cubit.toggleFavoriteMovie(movie);
          },
          icon: Icon(
            isSelected ? Icons.bookmark_added : Icons.bookmark_outline,
            color: isSelected ? AppTheme.secondaryColor : null,
          ),
        );
      },
    );
  }
}
