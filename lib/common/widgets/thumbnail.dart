import 'package:flutter/material.dart';
import 'package:movie_app/config/config.dart';

class Thumbnail extends StatelessWidget {
  const Thumbnail({
    required this.id,
    required this.imagePath,
    super.key,
  });

  final int id;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Hero(
        tag: 'movie$id',
        child: Image.network(
          '${Configurations.imageBaseUrl}/$imagePath',
          fit: BoxFit.cover,
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
