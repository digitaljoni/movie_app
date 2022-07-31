import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/common.dart';
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
        child: CachedNetworkImage(
          imageUrl: '${Configurations.imageBaseUrl}/$imagePath',
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const Loading(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
