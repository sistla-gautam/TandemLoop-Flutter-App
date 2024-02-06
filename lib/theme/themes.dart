import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color(0xff009688), // Teal
    secondary: Color(0xffFFD740), // Amber
    surface: Color(0xffffffff), // White
    onSurface: Color(0xff000000), // Black
    background: Color(0xfff5f5f5), // Light Grey
    error: Color(0xffFF5722), // Deep Orange
    onPrimary: Color(0xff000000), // Black
    onSecondary: Color(0xffffffff), // White
    onBackground: Color(0xff000000), // Black
    onError: Color(0xffffffff), // White
  ),
);

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xff009688), // Teal
      secondary: Color(0xffFFD740), // Amber
      surface: Color(0xff121212), // Black
      onSurface: Color(0xffffffff), // White
      background: Color(0xff212121), // Dark Grey
      error: Color(0xffFF5722), // Deep Orange
      onPrimary: Color(0xffffffff), // White
      onSecondary: Color(0xff000000), // Black
      onBackground: Color(0xffffffff), // White
      onError: Color(0xffffffff), // White
    ));

// ThemeData lightMode = ThemeData(
//     brightness: Brightness.light,
//     colorScheme: ColorScheme.light(
//       primary: Color(0xff009688), // Teal
//       secondary: Color(0xffFFD740), // Amber
//       surface: Color(0xffffffff), // Black
//       onSurface: Color(0xffffffff), // White
//       background: Color(0xff212121), // Dark Grey
//       error: Color(0xffFF5722), // Deep Orange
//       onPrimary: Color(0xffffffff), // White
//       onSecondary: Color(0xff000000), // Black
//       onBackground: Color(0xffffffff), // White
//       onError: Color(0xffffffff), // White
//     ));
