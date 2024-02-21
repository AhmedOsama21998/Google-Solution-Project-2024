import 'package:flutter/material.dart';
import 'package:google_solution_proj/config/sizes.dart';
import 'package:google_solution_proj/style/font_types.dart';

class TextWithBorder extends StatelessWidget {
  const TextWithBorder(
      {super.key,
      required this.height,
      required this.width,
      required this.borderWidth,
      required this.text});
  final double height;
  final double width;
  final double borderWidth;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: borderWidth,
            ),
          ),
        ),
        SizedBox(
          width: Sizes.width(context) * 0.02,
        ),
        Center(
          child: Text(
            text,
            style: FontTypes.textStyle14.copyWith(color: Colors.grey),
          ),
        ),
        SizedBox(
          width: Sizes.width(context) * 0.02,
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: borderWidth,
            ),
          ),
        ),
      ],
    );
  }
}
