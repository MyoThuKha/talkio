import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talkio/pages/home_page/home_page.dart';
import 'package:talkio/pages/register/register_page.dart';
import 'package:talkio/services/auth_service.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = AuthService();
    return StreamBuilder<User?>(
        stream: service.firebase.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const RegisterPage();
          }
        });
  }
}
