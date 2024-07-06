import 'package:flutter/material.dart';

class MainBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const MainBtn({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 17),
      fillColor: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: onTap,
      child: Text(
        label,
        style: TextStyle(color: Theme.of(context).colorScheme.surface),
      ),
    );
  }
}
