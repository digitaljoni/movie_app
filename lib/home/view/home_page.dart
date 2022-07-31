import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/config.dart';
import 'package:movie_app/favorites/favorites.dart';
import 'package:movie_app/home/home.dart';
import 'package:movie_app/popular_movies/popular_movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// The static route for PopularMoviesPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);

    return Scaffold(
      body: IndexedStack(
        index: selectedTab.index,
        children: const [
          PopularMoviesPage(),
          FavoritesPage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppTheme.bottomAppBarColor,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.popular,
              icon: Icons.movie_creation_outlined,
              text: 'Movies',
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.favorites,
              icon: Icons.bookmark_added_outlined,
              text: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    required this.groupValue,
    required this.value,
    required this.icon,
    required this.text,
  });

  final HomeTab groupValue;
  final HomeTab value;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final menuColor = groupValue != value ? null : AppTheme.secondaryColor;

    return GestureDetector(
      onTap: () => context.read<HomeCubit>().setTab(value),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: menuColor ?? Colors.transparent,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 32,
              color: menuColor,
            ),
            Text(
              text,
              style: TextStyle(
                color: menuColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
