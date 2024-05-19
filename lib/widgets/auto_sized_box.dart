import 'package:flutter/material.dart';

class AutoSizedBox extends StatelessWidget {
  final double width; 
  final double height; 
  const AutoSizedBox({super.key, this.width= 0, this.height = 0});

  //w: 430, h: 932

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * MediaQuery.of(context).size.width / 430,
      height: height * MediaQuery.of(context).size.height / 932,
    );
  }
}