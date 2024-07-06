import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talkio/animation/animated_button.dart';
import 'package:talkio/services/auth_service.dart';
import 'package:talkio/styles/input_style.dart';
import 'package:talkio/widgets/auto_sized_box.dart';
import 'package:talkio/widgets/main_btn.dart';

class RegisterPage extends StatefulWidget {
  static const route = "/register";
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  String email = "";
  String password = "";
  String confirmPassword = "";
  final service = AuthService();

  bool isPasswordCorrect = false;

  final _formKey = GlobalKey<FormState>();

  bool visiblePassword = false;

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        automaticallyImplyLeading: false,
        title: Text(
          "REGISTER",
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
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(30),
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
                  const AutoSizedBox(height: 24),
                  TextFormField(
                    decoration: inputStyle(
                      context,
                      suffix: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 3000),
                          child: Icon(
                            Icons.check,
                            color: isPasswordCorrect? Colors.amber[200]: Colors.white,
                          ),
                        ),
                      onSuffixTap: (){
                        setState(() {
                          visiblePassword = !visiblePassword;
                        });
                      }
                    ),
                    onChanged: (value) {
                      if (!isPasswordCorrect && (password == value)) {
                        setState(() => isPasswordCorrect = true);
                      }
                      else if (isPasswordCorrect && (password != value)){
                        setState(() => isPasswordCorrect = false);
                      }
                      confirmPassword = value;
                    },
                    obscureText: visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please fill your password to confirm.";
                      }
                      return null;
                    },
                  ),
                          
                  TextButton(
                    onPressed: () {},
                    child: const Text("Hi! Welcome to our world."),
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
                  const Text("Not a new guy?"),
                  TextButton(onPressed: (){
                    Navigator.pop(context);

                  }, child: const Text("Welcome back."),),
                ],
              ),
              MainBtn(
                onTap: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  if (password != confirmPassword){
                    return;
                  }
                  final result =  AuthService();
                  result.register(email, password);
                },
                label: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}