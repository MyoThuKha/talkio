import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:talkio/animation/animated_button.dart';

class AddButton extends StatefulWidget {
  const AddButton({super.key});

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  bool buttonPressed = false;

  final onClickDuration = const Duration(milliseconds: 200);
  final onClickAnimation = const Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 6, bottom: 6),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: AnimatedButton(
        onTap: (){},
        child: Container(
          width: MediaQuery.of(context).size.width / 5,
          height: MediaQuery.of(context).size.width / 5,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(25)),
          child: const Icon(Icons.add),
        )
            .animate(
              target: buttonPressed ? 1 : 0,
            )
            .scale(
              begin: const Offset(1, 1),
              end: const Offset(0.4, 0.4),
              duration: onClickDuration,
              delay: onClickDuration,
            ),
      ),
    );
  }
}
