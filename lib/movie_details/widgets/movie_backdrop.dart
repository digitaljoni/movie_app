import 'package:flutter/material.dart';
import 'package:movie_app/config/config.dart';

class MovieBackdrop extends StatelessWidget {
  const MovieBackdrop({
    required this.id,
    required this.imagePath,
    super.key,
  });

  final String imagePath;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'movie$id',
      child: Image.network(
        '${Configurations.imageBaseUrl}/$imagePath',
        height: MediaQuery.of(context).size.height / 2,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
