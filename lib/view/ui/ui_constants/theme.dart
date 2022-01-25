import 'package:flutter/material.dart';

class AppTheme {
  final _lightTextTheme = const TextTheme(
    bodyText2: TextStyle(
      fontSize: 14.0,
      color: Colors.black,
    ),
    headline1: TextStyle(
      fontSize: 56.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: TextStyle(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline4: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  final _darkTextTheme = const TextTheme(
    bodyText2: TextStyle(
      fontSize: 14.0,
      color: Colors.white,
    ),
    headline1: TextStyle(
      fontSize: 56.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: TextStyle(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  ThemeData get light {
    return ThemeData(
      textTheme: _lightTextTheme,
      unselectedWidgetColor: const Color(0xFFCFCFCF),
      // brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity),
    );
  }

  ThemeData get dark {
    return ThemeData(
      textTheme: _darkTextTheme,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
    );
  }
}
