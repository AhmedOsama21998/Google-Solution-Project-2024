import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  const ContainerButton(
      {super.key,
      required this.width,
      required this.height,
      required this.borderColor,
      required this.child,
      this.onTap});
  final double width;
  final double height;
  final Color borderColor;
  final Widget child;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor),
        ),
        child: child,
      ),
    );
  }
}
