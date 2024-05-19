import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talkio/pages/chats/chat_page.dart';
import 'package:talkio/pages/home_page/home_page.dart';
import 'package:talkio/pages/profile/profile_page.dart';
import 'package:talkio/pages/register/register_page.dart';
import 'package:talkio/pages/splash/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
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
            surface: Color(0xffffffff),
            
          ),
        // colorScheme: const ColorScheme.light(
        //   background: Color(0xffc5c5c5),
        // ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme:const TextTheme(
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
          )
        )
      ),
      initialRoute: SplashPage.route,
      routes: {
        SplashPage.route:(context) => const SplashPage(),
        HomePage.route:(context) => const HomePage(),
        ProfilePage.route:(context) => const ProfilePage(),
        RegisterPage.route:(context) => const RegisterPage(),
        ChatPage.route:(context) => const ChatPage(),
      },
    );
  }
}

