import 'package:flutter/material.dart';

class ProfileClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    final x = size.width;
    final y = size.height;
    final miniX = x / 7 * 5;
    final miniY = y / 7 * 4.7;

    final secondMiniY = y - miniY;

    final curveValue = x/12;

    //top left
    path.moveTo(curveValue, 0);
    path.quadraticBezierTo(0, 0, 0, curveValue);

    //bottom left
    path.lineTo(0, y- curveValue);
    path.quadraticBezierTo(0,y, curveValue, y);

    //bottom right
    path.lineTo(x - curveValue, y);
    path.quadraticBezierTo(x, y, x, y - curveValue);

    //
    path.lineTo(x, secondMiniY + curveValue);
    path.quadraticBezierTo(x, secondMiniY, x - curveValue, secondMiniY);

    path.lineTo(miniX + curveValue, secondMiniY);
    path.quadraticBezierTo(miniX, secondMiniY, miniX, secondMiniY - curveValue);

    path.lineTo(miniX, 0 + curveValue);
    path.quadraticBezierTo(miniX, 0, miniX - curveValue, 0);
    path.close();
    return path;
  }
  // Path getClip(Size size) {
  //   Path path = Path();
  //   final x = size.width;
  //   final y = size.height;
  //   final miniX = x / 5 * 4;
  //   final miniY = y/5 * 2;

  //   final curveValue = x/10;

  //   // path.moveTo(0, 0); // 1
  //   path.moveTo(curveValue, 0);
  //   path.quadraticBezierTo(0, 0, 0, curveValue);

  //   path.lineTo(0, y- curveValue);
  //   path.quadraticBezierTo(0,y, curveValue, y);

  //   path.lineTo(x - curveValue, y);
  //   path.quadraticBezierTo(x, y, x, y - curveValue);

  //   path.lineTo(x, miniY + curveValue);
  //   path.quadraticBezierTo(x, miniY, x - curveValue, miniY);

  //   path.lineTo(miniX + curveValue, miniY);
  //   path.quadraticBezierTo(miniX, miniY, miniX, miniY - curveValue);

  //   path.lineTo(miniX, 0 + curveValue);
  //   path.quadraticBezierTo(miniX, 0, miniX - curveValue, 0);
  //   path.close();
  //   return path;
  // }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}