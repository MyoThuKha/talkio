import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleBtn extends StatelessWidget {
  final Widget child;
  final double size;
  final VoidCallback? onTap;
  const CircleBtn({super.key, required this.child, this.size = 30, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: size / 2,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: child,
      ),
    );
  }
}