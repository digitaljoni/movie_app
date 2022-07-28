import 'package:flutter/material.dart';

class AppTheme {
  static const mobileBackgroundColor = Color.fromRGBO(14, 19, 36, 1);

  static const primaryColor = Color.fromRGBO(236, 155, 62, 1);
  static const secondaryColor = Color.fromRGBO(242, 207, 22, 1);
  static const textColors = Colors.white;

  static final defaultThemeData = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: mobileBackgroundColor,
    primaryColor: primaryColor,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 13,
        height: 18 / 13,
      ),
      bodyText2: TextStyle(
        fontSize: 11,
        height: 13 / 11,
      ),
      headline1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      headline2: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        height: 20 / 15,
      ),
      subtitle1: TextStyle(
        fontSize: 12,
        height: 16 / 12,
      ),
    ),
  );
}
