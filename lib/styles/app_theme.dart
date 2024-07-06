import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    surface: Color(0xffc5c5c5),
    primary: Color(0xff0f0f0f),
    secondary: Color(0xffFFC107),
    // surface: Color(0xffffffff),
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
  textTheme: appTextTheme,
);

ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    surface: Color(0xff0f0f0f),
    primary: Color(0xffc5c5c5),
    secondary: Color(0xffFFC107),
    // surface: Color(0xffffffff),
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
  textTheme: appTextTheme,
);

const screenPadding = EdgeInsets.symmetric(horizontal: 12);

const appTextTheme = TextTheme(
  headlineSmall: TextStyle(
    fontSize: 18,
    height: 3,
  ),
  displayLarge: TextStyle(
    fontSize: 70,
    height: 3,
    letterSpacing: 5,
    fontWeight: FontWeight.w200,
    fontFamily: "Bigger",
  ),
  displayMedium: TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.w200,
    fontFamily: "Bigger",
  ),
  titleLarge: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  ),

    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ));
