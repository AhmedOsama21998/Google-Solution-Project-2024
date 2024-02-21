import 'package:flutter/material.dart';

class ButtonCustomization extends StatelessWidget {
  const ButtonCustomization(
      {super.key,
      this.onPressed,
      required this.colorButton,
      required this.text,
      required this.focusColor,
      required this.buttonHeight,
      required this.hoverColor,
      required this.disabledColor,
      required this.buttonWidth,
      required this.borderRadius});
  final void Function()? onPressed;
  final Color colorButton;
  final double borderRadius;
  final String text;
  final Color focusColor;
  final double buttonHeight;
  final double buttonWidth;
  final Color hoverColor;
  final Color disabledColor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      color: colorButton,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      focusColor: focusColor,
      height: buttonHeight,
      minWidth: buttonWidth,
      hoverColor: hoverColor,
      disabledColor: disabledColor,
    );
  }
}
