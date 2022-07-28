import 'package:flutter/material.dart';
import 'package:movie_app/common/common.dart';
import 'package:movie_app/config/config.dart';
import 'package:movie_app/genres/genres.dart';
import 'package:movies_api/movies_api.dart';

class MovieDetailsInfo extends StatelessWidget {
  const MovieDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = context.read<Movie>();
    const radius = Configurations.radiusDouble;

    return Container(
      margin: EdgeInsets.only(
        top: (MediaQuery.of(context).size.height / 2) - radius,
      ),
      padding: const EdgeInsets.only(
        top: radius + 8,
        left: 20,
        right: 20,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppTheme.mobileBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieTitle(
            movieTitle: movie.title,
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 8),
          Rating(score: movie.voteAverage),
          const SizedBox(height: 16),
          GenreTags(genreIds: movie.genreIds),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 8),
                Text(
                  movie.overview,
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
