import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talkio/animation/animated_button.dart';

class AddButton extends StatefulWidget {
  const AddButton({super.key});

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  bool buttonPressed = false;


  Uint8List? image;

  final onClickDuration = const Duration(milliseconds: 200);
  final onClickAnimation = const Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 6, bottom: 6),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: AnimatedButton(
        onTap: pickImage,
        child: Container(
          width: MediaQuery.of(context).size.width / 5,
          height: MediaQuery.of(context).size.width / 5,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(25)),
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

  void pickImage()async{
    final picker = ImagePicker();

    final result = await picker.pickImage(source: ImageSource.gallery);

    if (result != null) {
      image = await result.readAsBytes();
    }
  }
}
