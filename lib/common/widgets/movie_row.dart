import 'package:flutter/material.dart';
import 'package:movie_app/common/common.dart';
import 'package:movie_app/genres/genres.dart';
import 'package:movie_app/movie_details/movie_details.dart';
import 'package:movies_api/movies_api.dart';

class PopularMovieRow extends StatelessWidget {
  const PopularMovieRow({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.of(context).push(MovieDetailsPage.route(movie: movie)),
      child: Container(
        margin: const EdgeInsets.all(10),
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Thumbnail(
              id: movie.id,
              imagePath: movie.posterPath,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieTitle(movie: movie),
                  Rating(
                    score: movie.voteAverage,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GenreTags(genreIds: movie.genreIds),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
