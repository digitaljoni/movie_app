import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/genres/cubit/genres_cubit.dart';

class GenreTags extends StatelessWidget {
  const GenreTags({required this.genreIds, super.key});

  final List<int> genreIds;

  @override
  Widget build(BuildContext context) {
    final genres = context.read<GenresCubit>().state.genres;

    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: genreIds
          .map<GenreTag>(
            (int genreId) =>
                GenreTag(genreName: genres.genreMap[genreId] ?? ''),
          )
          .toList(),
    );
  }
}

class GenreTag extends StatelessWidget {
  const GenreTag({required this.genreName, super.key});

  final String genreName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(
          236,
          155,
          62,
          .2,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      // margin: EdgeInsets.all(2),
      child: Text(
        genreName,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
