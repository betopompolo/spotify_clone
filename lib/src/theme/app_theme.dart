import 'package:flutter/material.dart';

final appDarkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.black,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.grey.shade900,
    filled: true,
    border: InputBorder.none,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.white,
  ),
  primaryColor: const Color(0xff00d15b),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith(
        (states) => const Color(0xff00d15b),
      ),
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
        ),
      ),
    ),
  ),
);
