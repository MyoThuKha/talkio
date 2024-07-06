import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
        colorScheme: const ColorScheme.light(
          // background: Color(0xffc5c5c5),
          // background: Color(0xffc5c5c5),
          surface: Color(0xffc5c5c5),
          primary: Color(0xff0f0f0f),
          // surface: Color(0xffffffff),
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: const TextTheme(
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
        ),
      );

ThemeData darkTheme = ThemeData(
        colorScheme: const ColorScheme.dark(
          // background: Color(0xff0f0f0f),
          surface: Color(0xff0f0f0f),
          primary: Color(0xffc5c5c5),
          // surface: Color(0xffffffff),
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: const TextTheme(
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
        ),
      );

const screenPadding = EdgeInsets.symmetric(horizontal: 12);
