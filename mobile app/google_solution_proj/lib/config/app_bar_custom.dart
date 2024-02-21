import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom(
      {super.key,
      required this.onPressedLeading,
      required this.iconLeading,
      required this.onPressedAction,
      required this.iconAction,
      required this.title});
  final void Function() onPressedLeading;
  final void Function() onPressedAction;
  final Widget iconLeading;
  final Widget iconAction;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(icon: iconLeading, onPressed: onPressedLeading),
      actions: [
        IconButton(icon: iconLeading, onPressed: onPressedLeading),
      ],
      title: Text(title),
    );
  }
}
