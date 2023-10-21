import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getBlackWhiteTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    primaryColor: const Color.fromARGB(255,12,12,12),
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: const Color.fromARGB(255, 12,12,12),
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 63,63,63),
      elevation: 0, systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Color.fromARGB(255, 60, 42, 33),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Color.fromARGB(255, 60, 42, 33),
        fontSize: 16,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.white,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      labelStyle: const TextStyle(
        color: Colors.white,
      ),
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
  );
}
