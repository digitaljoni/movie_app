import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({super.key, required this.movieTitle, this.style});

  final String movieTitle;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      movieTitle,
      style: style ?? Theme.of(context).textTheme.headline2,
    );
  }
}
