import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/config/config.dart';
import 'package:movie_app/favorites/widgets/favorites_body.dart';

/// {@template favorites_page}
/// A description for FavoritesPage
/// {@endtemplate}
class FavoritesPage extends StatelessWidget {
  /// {@macro favorites_page}
  const FavoritesPage({super.key});

  /// The static route for FavoritesPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const FavoritesPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(
            'assets/logo.svg',
            color: AppTheme.primaryColor,
            // height: 28,
          ),
        ),
        bottomOpacity: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const FavoritesView(),
    );
  }
}

/// {@template favorites_view}
/// Displays the Body of FavoritesView
/// {@endtemplate}
class FavoritesView extends StatelessWidget {
  /// {@macro favorites_view}
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const FavoritesBody();
  }
}
