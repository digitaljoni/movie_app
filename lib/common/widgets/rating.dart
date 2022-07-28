import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Rating extends StatelessWidget {
  const Rating({
    required this.score,
    super.key,
  });

  final double score;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/star.svg',
          width: 16,
          height: 16,
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            '$score / 10 IMDb',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ],
    );
  }
}
