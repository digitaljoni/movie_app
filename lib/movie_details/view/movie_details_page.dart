import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/movie_details/widgets/movie_details_body.dart';
import 'package:movie_app/popular_movies/cubit/cubit.dart';
import 'package:movies_api/movies_api.dart';

/// {@template movie_details_page}
/// A description for MovieDetailsPage
/// {@endtemplate}
class MovieDetailsPage extends StatelessWidget {
  /// {@macro movie_details_page}
  const MovieDetailsPage({
    super.key,
  });

  /// The static route for MovieDetailsPage
  static Route<dynamic> route({required Movie movie}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          RepositoryProvider<Movie>.value(
        value: movie,
        child: const MovieDetailsPage(),
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, 1);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.black38,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/arrow_left.svg',
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        bottomOpacity: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const MovieDetailsView(),
      extendBodyBehindAppBar: true,
    );
  }
}

/// {@template movie_details_view}
/// Displays the Body of MovieDetailsView
/// {@endtemplate}
class MovieDetailsView extends StatelessWidget {
  /// {@macro movie_details_view}
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MovieDetailsBody();
  }
}
