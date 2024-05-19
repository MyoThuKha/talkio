import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talkio/widgets/circle_btn.dart';
import 'package:talkio/widgets/custom_appbar.dart';

class SettingsPage extends StatefulWidget {
  static const route = "/settings";
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "Settings",
        actions: [
        CircleBtn(
          size: 80,
          onTap: (){},
          child: Icon(Icons.dark_mode),
        ),

        ]
      ),
      body: const Column(
        children: [
        ],
      ),
    );
  }
}
