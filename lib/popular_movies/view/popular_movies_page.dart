import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/config/config.dart';
import 'package:movie_app/popular_movies/cubit/cubit.dart';
import 'package:movie_app/popular_movies/widgets/popular_movies_body.dart';

/// {@template popular_movies_page}
/// A description for PopularMoviesPage
/// {@endtemplate}
class PopularMoviesPage extends StatelessWidget {
  /// {@macro popular_movies_page}
  const PopularMoviesPage({super.key});

  /// The static route for PopularMoviesPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const PopularMoviesPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: Hero(
            tag: 'logo',
            child: SvgPicture.asset(
              'assets/logo.svg',
              color: AppTheme.primaryColor,
              // height: 28,
            ),
          ),
        ),
        bottomOpacity: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const PopularMoviesView(),
    );
  }
}

/// {@template popular_movies_view}
/// Displays the Body of PopularMoviesView
/// {@endtemplate}
class PopularMoviesView extends StatelessWidget {
  /// {@macro popular_movies_view}
  const PopularMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PopularMoviesCubit, PopularMoviesState>(
      listener: (context, state) {
        if (state.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Movie Fetch Failed'),
              ),
            );
        }
      },
      child: const PopularMoviesBody(),
    );
  }
}
