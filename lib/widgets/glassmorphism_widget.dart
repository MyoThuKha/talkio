import 'dart:ui';

import 'package:flutter/material.dart';

class GlassmorphismWidget extends StatelessWidget {
  final Widget child;
  final BorderRadiusGeometry borderRadius;
  const GlassmorphismWidget(
      {super.key, required this.child, this.borderRadius = BorderRadius.zero});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: child,
      ),
    );
  }
}
