import 'package:flutter/material.dart';

class PillTag extends StatelessWidget {
  final String label;
  final Widget? leading;
  final Widget? trailing;
  final Color? symbolBG;

  const PillTag({super.key, required this.label, this.leading, this.trailing, this.symbolBG});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          leading ==null ? const SizedBox():
          CircleAvatar(
            radius: 10,
            backgroundColor: symbolBG,
            child: leading,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          const SizedBox(width: 4),
          trailing ==null ? const SizedBox():
          CircleAvatar(
            radius: 10,
            backgroundColor: symbolBG,
            child: leading,
          ),
        ],
      ),
    );
  }
}
