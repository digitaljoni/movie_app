part of 'home_cubit.dart';

enum HomeTab { popular, favorites }

class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.popular,
  });

  final HomeTab tab;

  @override
  List<Object> get props => [tab];
}
