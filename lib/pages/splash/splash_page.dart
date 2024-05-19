import 'package:flutter/material.dart';
import 'package:talkio/pages/main_page.dart';

class SplashPage extends StatefulWidget {
  static const route = "/splash";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const MainPage(),));
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(),
            FilledButton(onPressed: (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const MainPage(),));

            }, child: Text("proceed"))
          ],
        ),

      ),
    );
  }
}