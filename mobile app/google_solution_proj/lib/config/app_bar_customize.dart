import 'package:flutter/material.dart';

class AppBarCustomize extends StatelessWidget {
  const AppBarCustomize(
      {super.key,
      required this.logo,
      required this.scale,
      required this.fit,
      required this.icon,
      required this.iconColor,
      required this.imageHeight,
      required this.title,
      this.onPressed});
  final String logo;
  final double scale;
  final BoxFit fit;
  final IconData icon;
  final Color iconColor;
  final double imageHeight;
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image.asset(
        logo,
        scale: scale,
        fit: fit,
        height: imageHeight,
      ),
      actions: [
        IconButton(
          icon: Icon(
            icon,
            color: iconColor,
          ),
          onPressed: onPressed,
        )
      ],
      title: Text(title),
    );
  }
}
