import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(
    {required BuildContext context,
    required String title,
    List<Widget> actions = const []}) {
  return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      surfaceTintColor: Theme.of(context).colorScheme.surface,
      automaticallyImplyLeading: false,
      title: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.displayLarge,
      ),
      centerTitle: false,
      toolbarHeight: 120,
      actions: actions);
}
