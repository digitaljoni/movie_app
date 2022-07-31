import 'package:flutter/material.dart';
import 'package:movie_app/favorites/widgets/favorites_button.dart';
import 'package:movies_api/movies_api.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({super.key, required this.movie, this.style});

  final Movie movie;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            movie.title,
            style: style ?? Theme.of(context).textTheme.headline2,
          ),
        ),
        FavoritesButton(movie: movie),
      ],
    );
  }
}
