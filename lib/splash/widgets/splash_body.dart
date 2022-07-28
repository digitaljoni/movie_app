import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/config/config.dart';

/// {@template splash_body}
/// Body of the SplashPage.
///
/// Add what it does
/// {@endtemplate}
class SplashBody extends StatelessWidget {
  /// {@macro splash_body}
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'logo',
        child: SvgPicture.asset(
          'assets/logo.svg',
          color: AppTheme.primaryColor,
          height: 80,
        ),
      ),
    );
  }
}
