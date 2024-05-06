import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talkio/pages/home_page/home_page.dart';
import 'package:talkio/styles/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talkio',
      // theme: lightTheme,
      // darkTheme: darkTheme,
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 18,
            height: 3,
          )
        )
      ),
      home: const HomePage(),
    );
  }
}

