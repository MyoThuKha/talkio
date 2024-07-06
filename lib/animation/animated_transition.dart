import 'package:flutter/material.dart';

class BackTransition extends StatelessWidget {
  final Widget body;
  final Widget? btn;
  const BackTransition({super.key, required this.body,this.btn});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        body,
        btn ?? const SizedBox(),
      ],
    );
  }
}