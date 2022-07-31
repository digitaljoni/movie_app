import 'package:flutter/material.dart';
import 'package:movie_app/common/common.dart';
import 'package:movies_api/movies_api.dart';

class PopularMoviesList extends StatelessWidget {
  const PopularMoviesList({
    required this.movies,
    super.key,
  });

  final Movies movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.count,
      itemBuilder: (context, index) {
        return PopularMovieRow(
          movie: movies.movieList[index],
        );
      },
    );
  }
}
