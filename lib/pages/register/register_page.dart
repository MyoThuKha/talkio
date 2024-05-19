import 'package:flutter/material.dart';
import 'package:talkio/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  static const route = "/register";
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (value) {
                email = value;
              },
            ),
            TextFormField(
              onChanged: (value) {
                password = value;
              },

            ),
            FilledButton(onPressed: (){
              final service = AuthService();
              service.login(email, password);
            }, child: Text("Login")),
          ],
        ),
      ),
    );
  }
}