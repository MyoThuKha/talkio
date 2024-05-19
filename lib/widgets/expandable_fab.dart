import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:talkio/pages/settings/settings_page.dart';

class ExpandableFab extends StatefulWidget {
  const ExpandableFab({super.key});

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab> {
  bool fabOpen = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => fabOpen = true);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOut,
        width: fabOpen ? MediaQuery.of(context).size.width / 1.085 : 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: const Color.fromRGBO(0, 0, 0, 0.3),
          ),
        ),
        child: fabOpen
            ? SizedBox(
                child: Row(
                  children: [
                    FabItem(
                      onClick: () {
                        Navigator.pushNamed(context, SettingsPage.route);
                      },
                      backgroundColor: Colors.white,
                      child: const Icon(Icons.search),
                    ),
                    FabItem(
                      onClick: () {
                        Navigator.pushNamed(context, SettingsPage.route);
                      },
                      backgroundColor: Colors.white,
                      child: const Icon(Icons.settings),
                    ),
                    FabItem(
                      onClick: () {
                        setState(() => fabOpen = false);
                      },
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: const Icon(Icons.arrow_forward_rounded, color: Colors.white),
                    )
                  ],
                ),
              )
            : const Center(
                child: Icon(Icons.menu),
              ),
      ),
    );
  }
}

class FabItem extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final VoidCallback onClick;
  const FabItem({super.key, required this.child, required this.onClick, this.backgroundColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(28),
        child: Ink(
          height: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(28),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(28),
            onTap: onClick,
            child: child,
          ),
        ),
      ),
    );
  }
}
