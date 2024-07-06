import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:talkio/pages/route_page.dart';

class SplashPage extends StatefulWidget {
  static const route = "/splash";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3), startApp);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const IconBackgroundWidget(isTop: true).animate().slide(
                    begin: const Offset(-2, 0),
                    end: const Offset(0, 0),
                    delay: const Duration(seconds: 1),
                    duration: const Duration(milliseconds: 500),
                  ),
              const IconBackgroundWidget(isTop: false).animate().slide(
                    begin: const Offset(2, 0),
                    end: const Offset(0, 0),
                    delay: const Duration(seconds: 1),
                    duration: const Duration(milliseconds: 500),
                  ),
              Center(
                child: Text(
                  "TALKIO",
                  style: Theme.of(context).textTheme.displayLarge,
                ).animate().fadeIn(duration: const Duration(seconds: 1)),
              ),
            ],
          ),
        ),

      ),
    );
  }

  void startApp() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const RoutePage(),
        ));
  }
}


class IconBackgroundWidget extends StatelessWidget {
  final bool isTop;
  const IconBackgroundWidget({
    super.key,
    required this.isTop,
  });

  @override
  Widget build(BuildContext context) {
    final roundBorder = MediaQuery.of(context).size.width * 0.12;
    return Container(
      width: MediaQuery.of(context).size.width * 0.46,
      height: MediaQuery.of(context).size.width * 0.23,
      // height: 100,
      margin: isTop
          ? EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.12)
          : EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
      decoration: BoxDecoration(
         color: Colors.amber,
         borderRadius: BorderRadius.only(
           topRight:  Radius.circular(isTop? roundBorder: 0),
           bottomLeft: Radius.circular(isTop? roundBorder: 0),
           topLeft:  Radius.circular(isTop? 0: roundBorder),
           bottomRight: Radius.circular(isTop? 0: roundBorder),
         ),
       ),
     );
  }
}
