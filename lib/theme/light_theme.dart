import 'package:flutter/material.dart';
import 'package:sammyajax/util/constants.dart';

ThemeData light_theme = ThemeData(
  appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: Colors.black)),
  brightness: Brightness.light,
  platform: TargetPlatform.android,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(
          color: Color.fromARGB(255, 226, 20, 20), style: BorderStyle.solid),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 226, 20, 20),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(
        color: Colors.black,
        fontFamily: Constants.garamond_regular,
        fontSize: 18),
    labelStyle: const TextStyle(
        color: Colors.black,
        fontFamily: Constants.garamond_regular,
        fontSize: 20),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.3),
      ),
    ),
    errorStyle: const TextStyle(
        color: Color.fromARGB(255, 226, 20, 20),
        fontWeight: FontWeight.bold,
        fontSize: 20,
        fontFamily: Constants.garamond_regular,
        letterSpacing: 1.2),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 226, 20, 20),
      ),
    ),
  ),
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    primaryContainer: Colors.white,
    primary: Color.fromARGB(255, 226, 20, 20),
  ),
  useMaterial3: true,
);
