import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talkio/pages/chats/chat_page.dart';
import 'package:talkio/pages/home_page/home_page.dart';
import 'package:talkio/pages/profile/profile_page.dart';
import 'package:talkio/pages/register/register_page.dart';
import 'package:talkio/pages/settings/settings_page.dart';
import 'package:talkio/pages/splash/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:talkio/providers/app_provider.dart';
import 'package:talkio/styles/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final theme = ref.watch(appProvider);
    return MaterialApp(
      title: 'Talkio',
      // theme: lightTheme,
      // darkTheme: darkTheme,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: theme.isDarkMode? ThemeMode.dark: ThemeMode.light,

      initialRoute: SplashPage.route,
      routes: {
        SplashPage.route: (context) => const SplashPage(),
        HomePage.route: (context) => const HomePage(),
        ProfilePage.route: (context) => const ProfilePage(),
        RegisterPage.route: (context) => const RegisterPage(),
        ChatPage.route: (context) => const ChatPage(),
        SettingsPage.route: (context) => const SettingsPage(),
      },
    );
  }
}

