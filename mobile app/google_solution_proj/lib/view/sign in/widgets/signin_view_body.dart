import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_solution_proj/config/Sign_with_platorm_account.dart';
import 'package:google_solution_proj/config/auth_customize.dart';
import 'package:google_solution_proj/config/button_customization.dart';
import 'package:google_solution_proj/config/check_have_account.dart';
import 'package:google_solution_proj/config/sizes.dart';
import 'package:google_solution_proj/config/text_with_border.dart';
import 'package:google_solution_proj/controller/login_provider.dart';
import 'package:google_solution_proj/style/font_types.dart';
import 'package:google_solution_proj/style/styles.dart';
import 'package:provider/provider.dart';

class SignInViewsBody extends StatefulWidget {
  const SignInViewsBody({super.key});

  @override
  State<SignInViewsBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewsBody> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> key = GlobalKey();
    return SafeArea(
        child: Scaffold(
            body: Form(
      key: key,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome',
                  style: FontTypes.textStyle30,
                ),
                SizedBox(
                  width: Sizes.width(context) * 0.02,
                ),

                /// Edit color
                Text('back',
                    style:
                        FontTypes.textStyle30.copyWith(color: Styles.kColor)),
              ],
            ),
            SizedBox(
              height: Sizes.height(context) * 0.02,
            ),
            Center(
              child: Text(
                'Please enter your email & password to \naccess your account.',
                style: FontTypes.textStyle16.copyWith(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: Sizes.height(context) * 0.02,
            ),
            AuthCustomize(
              onChanged: (value) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return 'this is field is required';
                }
              },
              labelText: 'Email',
              hintText: 'Enter your Email',
              icon: const Icon(Icons.email),
              iconColor: const Color(0xff92929D),
              obscureText: false,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: Sizes.height(context) * 0.05,
            ),
            AuthCustomize(
              onChanged: (value) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return 'this is field is required';
                }
              },
              labelText: 'Password',
              hintText: 'Enter your password',
              icon: const Icon(Icons.remove_red_eye),
              iconColor: const Color(0xff92929D),
              obscureText: true,
              controller: passwordController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: Sizes.height(context) * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      tristate: true,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    const Text(
                      'Remember me',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    )
                  ],
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Styles.kColor),
                    )),
              ],
            ),
            SizedBox(
              height: Sizes.height(context) * 0.05,
            ),
            ButtonCustomization(
              colorButton: Styles.kColor,
              text: 'Login',
              focusColor: Colors.lightGreen,
              buttonHeight: Sizes.height(context) * 0.07,
              hoverColor: Colors.green,
              disabledColor: Colors.grey,
              buttonWidth: Sizes.width(context),
              borderRadius: 8,
              onPressed: () {
                try {
                  if (key.currentState!.validate() &&
                      FirebaseAuth.instance.currentUser!.emailVerified) {
                    Provider.of<LoginProvider>(context, listen: false)
                        .loginMethod(
                            emailAddress: emailController.text,
                            password: passwordController.text);
                    // Navigator.push(context, MaterialPageRoute(
                    //     builder: (context) => const HomeView()));
                  } else {
                    FirebaseAuth.instance.currentUser!.sendEmailVerification();
                    AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Success',
                            desc: 'Check your gmail to verify account',
                            descTextStyle: TextStyle(color: Styles.kColor))
                        .show;
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
            SizedBox(
              height: Sizes.height(context) * 0.02,
            ),
            Center(
              child: CheckHaveAccount(
                  onPressed: () {},
                  text: 'Don’t have an account?',
                  signText: 'Sign Up'),
            ),
            SizedBox(
              height: Sizes.height(context) * 0.05,
            ),
            TextWithBorder(
                height: Sizes.height(context) * 0.002,
                width: Sizes.width(context) * 0.35,
                borderWidth: 1,
                text: 'Log in with'),
            SizedBox(
              height: Sizes.height(context) * 0.02,
            ),
            const SignWithPlatformAccount()
          ]),
        ),
      ),
    )));
  }
}
