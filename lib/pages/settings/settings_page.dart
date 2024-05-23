import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talkio/animation/animated_transition.dart';
import 'package:talkio/providers/app_provider.dart';
import 'package:talkio/widgets/circle_btn.dart';
import 'package:talkio/widgets/custom_appbar.dart';

class SettingsPage extends ConsumerStatefulWidget {
  static const route = "/settings";
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}


bool toggleDark = false;

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BackTransition(
      btn: GestureDetector(
        onTap: () async {
          setState(() {
            toggleDark = true;
          });
          await Future.delayed(const Duration(seconds: 3));
          setState(() {
            toggleDark = false;
          });
        },
        child: const CircleAvatar(
          radius: 40,
          child: Icon(Icons.dark_mode),
        )
            .animate(
              target: toggleDark ? 1 : 0,
            )
            .scale(
              duration: const Duration(milliseconds: 400),
              begin: const Offset(1, 1),
              end: const Offset(20, 20),
              // width: goBack ? 80000: 80,
              // height: goBack ? 80000: 80,
            ),
      ),
      body: Scaffold(
        appBar: customAppBar(
          context: context,
          title: "Settings",
          actions: [
          // CircleBtn(
          //   size: 80,
          //   onTap: (){},
          //   child: Icon(Icons.dark_mode),
          // ),
          IconButton(onPressed: (){
            ref.read(appProvider.notifier).toggleDarkMode();
          }, icon: Icon(Icons.dark_mode)),
      
          ]
        ),
        body: const Column(
          children: [
          ],
        ),
      ),
    );
  }
}
