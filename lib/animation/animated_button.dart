import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedButton extends StatefulWidget {
  final Widget child;
  final double scale;
  final VoidCallback onTap;
  const AnimatedButton({super.key, required this.child, this.scale = 0.4, required this.onTap});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool buttonPressed = false;

  final onClickDuration = const Duration(milliseconds: 200);
  final onClickAnimation = const Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
        onTapDown: (details) async {
          setState(() {
            buttonPressed = !buttonPressed;
          });
        },
        onTapUp: (details) async{
          await Future.delayed(const Duration(milliseconds: 500));
          setState(() {
            buttonPressed = !buttonPressed;
          });
        },
        child: widget.child
            .animate(
              target: buttonPressed ? 1 : 0,
            )
            .scale(
              begin: const Offset(1, 1),
              end: Offset(widget.scale, widget.scale),
              duration: onClickDuration,
              delay: onClickDuration,
            )
    );
  }
}
