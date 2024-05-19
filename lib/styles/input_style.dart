
  import 'package:flutter/material.dart';

InputDecoration inputStyle(BuildContext context, {Widget? suffix, VoidCallback? onSuffixTap}) {
    return InputDecoration(
        border: borderStyle,
        errorBorder: borderStyle,
        enabledBorder: borderStyle,
        focusedBorder: borderStyle,
        disabledBorder: borderStyle,
        suffixIcon: suffix == null
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: onSuffixTap,
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: suffix,
                  ),
                ),
              ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 18));
  }


InputDecoration sendInputStyle(BuildContext context, {Widget? suffix, VoidCallback? onSuffixTap}) {
    return InputDecoration(
        border: borderStyle,
        errorBorder: borderStyle,
        enabledBorder: borderStyle,
        focusedBorder: borderStyle,
        disabledBorder: borderStyle,
        suffixIcon: suffix == null
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.all(4),
                child: GestureDetector(
                  onTap: onSuffixTap,
                  child: suffix,
                ),
              ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 18));
  }

  final borderStyle = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(30),
  );