import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talkio/pages/home_page/home_page.dart';
import 'package:talkio/pages/profile/profile_page.dart';
import 'package:talkio/pages/register/register_page.dart';
import 'package:talkio/pages/splash/splash_page.dart';
import 'package:talkio/styles/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
            background: Color(0xffc5c5c5),
            primary: Color(0xff0f0f0f),
          ),
        // colorScheme: const ColorScheme.light(
        //   background: Color(0xffc5c5c5),
        // ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 18,
            height: 3,
          )
        )
      ),
      initialRoute: SplashPage.route,
      routes: {
        SplashPage.route:(context) => const SplashPage(),
        HomePage.route:(context) => const HomePage(),
        ProfilePage.route:(context) => const ProfilePage(),
        RegisterPage.route:(context) => const RegisterPage(),
      },
    );
  }
}

