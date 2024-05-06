import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  // brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.red,
  ),
  // colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffc5c5c5)),
  useMaterial3: true,
);

ThemeData darkTheme = ThemeData(
  // brightness: Brightness.dark,
  // colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff020202)),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
  useMaterial3: true,
);

const screenPadding = EdgeInsets.symmetric(horizontal: 12);
