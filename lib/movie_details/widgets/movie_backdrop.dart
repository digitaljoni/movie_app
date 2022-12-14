import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/common.dart';
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
      child: CachedNetworkImage(
        imageUrl: '${Configurations.imageBaseUrl}/$imagePath',
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const Loading(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        height: MediaQuery.of(context).size.height / 2,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
