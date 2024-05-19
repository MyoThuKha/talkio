import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:talkio/widgets/auto_sized_box.dart';
import 'package:talkio/widgets/pill_tag.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 8,
        right: 8,
        top: MediaQuery.of(context).size.height / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              PillShapeItem(
                label: "Google",
                // icon: Icon(
                //   Icons.apple,
                //   color: Theme.of(context).colorScheme.primary,
                // ),
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const AutoSizedBox(height: 12),
              PillShapeItem(
                label: "Facebook",
                // alignment: Alignment.centerLeft,
                icon: FaIcon(
                  FontAwesomeIcons.facebookF,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const AutoSizedBox(height: 12),
              PillShapeItem(
                label: "Guest",
                icon: Icon(
                  Icons.person_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const AutoSizedBox(height: 12),
              PillShapeItem(
                onTap: () => Navigator.pop(context),
                label: "Go Back",
                // alignment: Alignment.centerLeft,
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ].animate(
              interval: const Duration(milliseconds: 400),
            ).fadeIn(duration: const Duration(milliseconds: 600)),
          ),
        ),
      ),
    );
  }
}

