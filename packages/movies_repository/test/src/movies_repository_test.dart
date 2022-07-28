// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_repository/movies_repository.dart';

void main() {
  group('MoviesRepository', () {
    test('can be instantiated', () {
      expect(MoviesRepository(), isNotNull);
    });
  });
}
