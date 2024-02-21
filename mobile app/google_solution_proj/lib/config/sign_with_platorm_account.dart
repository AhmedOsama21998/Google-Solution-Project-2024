import 'package:flutter/material.dart';
import 'package:google_solution_proj/config/assets.dart';
import 'package:google_solution_proj/config/container_button.dart';
import 'package:google_solution_proj/config/sizes.dart';
import 'package:google_solution_proj/controller/google_sign_in_provider.dart';
import 'package:google_solution_proj/style/styles.dart';
import 'package:provider/provider.dart';

class SignWithPlatformAccount extends StatelessWidget {
  const SignWithPlatformAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ContainerButton(
            onTap: () {
              Provider.of<GoogleSignInProvider>(context, listen: false)
                  .signInWithGoogle();
            },
            width: Sizes.width(context) * 0.2,
            height: Sizes.height(context) * 0.1,
            borderColor: Styles.kColor,
            child: Image.asset(AssetData.google)),
        SizedBox(width: Sizes.width(context) * 0.03),
        ContainerButton(
            onTap: () {},
            width: Sizes.width(context) * 0.2,
            height: Sizes.height(context) * 0.1,
            borderColor: Styles.kColor,
            child: Image.asset(AssetData.facebook)),
        SizedBox(width: Sizes.width(context) * 0.03),
        ContainerButton(
            onTap: () {},
            width: Sizes.width(context) * 0.2,
            height: Sizes.height(context) * 0.1,
            borderColor: Styles.kColor,
            child: Image.asset(AssetData.apple))
      ],
    );
  }
}
