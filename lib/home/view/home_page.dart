import 'package:flutter/material.dart';
import 'package:movie_app/genres/cubit/cubit.dart';
import 'package:movie_app/popular_movies/view/popular_movies_page.dart';
import 'package:movie_app/splash/splash.dart';

/// {@template home_page}
/// A description for HomePage
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  /// The static route for HomePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenresCubit, GenresState>(
      builder: (context, state) {
        if (state.isSuccess) {
          return const PopularMoviesPage();
        }
        return const SplashPage();
      },
    );
  }
}
