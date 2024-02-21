import 'package:flutter/material.dart';
import 'package:google_solution_proj/config/sizes.dart';
import 'package:google_solution_proj/style/font_types.dart';
import 'package:google_solution_proj/style/styles.dart';

class AuthCustomize extends StatelessWidget {
  const AuthCustomize(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.icon,
      this.iconColor,
      this.validator,
      required this.obscureText,
      this.onChanged,
      required this.controller,
      this.keyboardType});
  final String labelText;
  final String hintText;
  final Widget? icon;
  final Color? iconColor;
  final String? Function(String?)? validator;
  final bool obscureText;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: FontTypes.textStyle16.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: Sizes.height(context) * 0.02,
        ),
        Container(
          height: Sizes.height(context) * 0.07,
          width: Sizes.width(context) * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: TextFormField(
            focusNode: focusNode,
            onChanged: onChanged,
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: InputBorder.none,
                hintText: hintText,
                suffixIcon: icon,
                iconColor: iconColor),
            validator: validator,
            obscureText: obscureText,
          ),
        ),
      ],
    );
  }
}
