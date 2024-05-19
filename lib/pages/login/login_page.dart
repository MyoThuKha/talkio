import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talkio/animation/animated_button.dart';
import 'package:talkio/pages/register/register_page.dart';
import 'package:talkio/services/auth_service.dart';
import 'package:talkio/styles/input_style.dart';
import 'package:talkio/widgets/auto_sized_box.dart';
import 'package:talkio/widgets/main_btn.dart';

class LoginPage extends StatefulWidget {
  static const route = "/login";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";
  final service = AuthService();

  final _formKey = GlobalKey<FormState>();

  bool visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        surfaceTintColor: Theme.of(context).colorScheme.background,
        title: Text(
          "LOGIN",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        centerTitle: false,
        toolbarHeight: 120,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: AnimatedButton(
            onTap: (){
              showDialog(
                useSafeArea: true,
                  context: context,
                  builder: (context) => Container(
                    margin:EdgeInsets.only(
                      left: 8,
                      right: 8,
                    top: MediaQuery.of(context).size.height / 2,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  child: Column(
                    children: [
                    ],
                  ),
                  ),
                );



            },
            child: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(
                "assets/icons/two_bar.svg",
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)
              ),
            ),
          ),
          ),

        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    // decoration: inputStyle,
                    decoration: inputStyle(
                      context,
                      suffix: const Icon(Icons.paste),
                    ),
                    onChanged: (value) => email = value,
                    keyboardType: TextInputType.emailAddress,
                    
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please fill in your email.";
                      }
                      return null;
                    },
                  ),
                  const AutoSizedBox(height: 24),
                  TextFormField(
                    decoration: inputStyle(
                      context,
                      suffix: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 3000),
                        child: Icon(visiblePassword? Icons.visibility_off: Icons.visibility_rounded)),
                      onSuffixTap: (){
                        setState(() {
                          visiblePassword = !visiblePassword;
                        });
                      }
                    ),
                    onChanged: (value) => password = value,
                    obscureText: visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please fill in your password.";
                      }
                      return null;
                    },
                  ),
                          
                  TextButton(
                    onPressed: () {},
                    child: const Text("Hello! Welcome back."),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Never try Talkio?"),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, RegisterPage.route);

                  }, child: const Text("Join Our World."),),
                ],
              ),
              MainBtn(
                onTap: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  service.login(email, password);
                },
                label: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }



}