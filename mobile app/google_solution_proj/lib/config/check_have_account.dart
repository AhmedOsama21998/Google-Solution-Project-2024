import 'package:flutter/material.dart';
import 'package:google_solution_proj/style/font_types.dart';
import 'package:google_solution_proj/style/styles.dart';

class CheckHaveAccount extends StatelessWidget {
  const CheckHaveAccount(
      {super.key, required this.text, this.onPressed, required this.signText});
  final String text;
  final String signText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: FontTypes.textStyle14.copyWith(color: Colors.grey),
        ),
        TextButton(
            onPressed: onPressed,
            child: Row(
              children: [
                Text(
                  signText,
                  style: FontTypes.textStyle14.copyWith(color: Styles.kColor),
                ),
                Icon(
                  Icons.call_made,
                  color: Styles.kColor,
                  size: 15,
                )
              ],
            )),
      ],
    );
  }
}
