import 'package:flutter/material.dart';

Route scaleCurveRoute(StatefulWidget destination) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => destination,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: CurvedAnimation(
            parent: animation, curve: Curves.fastEaseInToSlowEaseOut),
        child: child,
      );
    },
  );
}