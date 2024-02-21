import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:google_solution_proj/config/assets.dart';
import 'package:google_solution_proj/config/auth_customize.dart';
import 'package:google_solution_proj/config/button_customization.dart';
import 'package:google_solution_proj/config/check_have_account.dart';
import 'package:google_solution_proj/config/container_button.dart';
import 'package:google_solution_proj/config/sign_with_platorm_account.dart';
import 'package:google_solution_proj/config/sizes.dart';
import 'package:google_solution_proj/config/text_with_border.dart';
import 'package:google_solution_proj/controller/signup/signup_provider.dart';
import 'package:google_solution_proj/style/font_types.dart';
import 'package:google_solution_proj/style/styles.dart';
import 'package:google_solution_proj/view/sign%20in/sign%20in_view.dart';
import 'package:google_solution_proj/view/sign%20up/sign_up_view.dart';
import 'package:im_stepper/stepper.dart';
import 'package:provider/provider.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  String countryValue = "";
  String dropdownValue = "Male";
  @override
  Widget build(BuildContext context) {
    CollectionReference userData =
        FirebaseFirestore.instance.collection("user data");
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController hardwareIdController = TextEditingController();
    GlobalKey<FormState> key = GlobalKey();
    Future<void> addUserData() {
      return userData.add({
        "name": nameController.text,
        "email": emailController.text,
        "phone": phoneController.text,
        "hardware id": hardwareIdController.text,
        "country": countryValue,
        "gender": dropdownValue
      });
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: key,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome to',
                        style: FontTypes.textStyle24,
                      ),
                      SizedBox(
                        width: Sizes.width(context) * 0.02,
                      ),

                      /// Edit color
                      Text('Mplant',
                          style: FontTypes.textStyle24
                              .copyWith(color: Styles.kColor)),
                    ],
                  ),
                  SizedBox(
                    height: Sizes.height(context) * 0.02,
                  ),
                  Center(
                    child: Text(
                      'Please enter your information ',
                      textAlign: TextAlign.center,
                      style: FontTypes.textStyle16.copyWith(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: Sizes.height(context) * 0.02,
                  ),
                  SizedBox(
                    height: Sizes.height(context) * 0.03,
                  ),
                  AuthCustomize(
                    onChanged: (value) {
                      nameController.text = value;
                    },
                    keyboardType: TextInputType.name,
                    labelText: 'Name',
                    hintText: 'Enter Your Name',
                    obscureText: false,
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'this is field is required';
                      } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                          .hasMatch(value)) {
                        return 'Invalid number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: Sizes.height(context) * 0.03),
                  AuthCustomize(
                    onChanged: (value) {
                      phoneController.text = value;
                    },
                    keyboardType: TextInputType.phone,
                    labelText: 'Phone Number',
                    hintText: 'Enter Your Phone Number',
                    obscureText: false,
                    controller: phoneController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'this is field is required';
                      } else if (!RegExp(
                              r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
                          .hasMatch(value)) {
                        return 'Invalid name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: Sizes.height(context) * 0.03),
                  AuthCustomize(
                    onChanged: (value) {
                      emailController.text = value;
                    },
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                    obscureText: false,
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'this is field is required';
                      } else if (!RegExp(
                              r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$')
                          .hasMatch(value)) {
                        return 'Invalid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: Sizes.height(context) * 0.03),
                  AuthCustomize(
                    onChanged: (value) {
                      passwordController.text = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'this is field is required';
                      } else if (!RegExp(
                        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                      ).hasMatch(value)) {
                        return 'Your password is weak';
                      }
                      return null;
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
                    height: Sizes.height(context) * 0.03,
                  ),
                  AuthCustomize(
                    onChanged: (value) {
                      confirmPasswordController.text = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'this is field is required';
                      } else if (!RegExp(
                        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                      ).hasMatch(value)) {
                        return 'Your password is weak';
                      } else if (value != passwordController.text) {
                        return 'has not match';
                      }
                      return null;
                    },
                    labelText: 'Confirm Password',
                    hintText: 'Confirm Password',
                    icon: const Icon(Icons.remove_red_eye),
                    iconColor: const Color(0xff92929D),
                    obscureText: true,
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: Sizes.height(context) * 0.03),
                  const Text(
                    'Country',
                    textAlign: TextAlign.right,
                    style: FontTypes.textStyle16,
                  ),
                  SizedBox(
                    height: Sizes.height(context) * 0.02,
                  ),
                  CSCPicker(
                    showCities: false,
                    showStates: false,
                    flagState: CountryFlag.DISABLE,
                    dropdownDecoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1)),
                    countrySearchPlaceholder: "Country",
                    onCountryChanged: (value) {
                      setState(() {
                        ///store value in country variable
                        countryValue = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: Sizes.height(context) * 0.03,
                  ),
                  const Text(
                    'Gender',
                    style: FontTypes.textStyle16,
                  ),
                  SizedBox(
                    height: Sizes.height(context) * 0.02,
                  ),
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    hint: const Text(
                      ' Select Gender',
                      style: FontTypes.textStyle16,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey))),
                    itemHeight: Sizes.height(context) * 0.07,
                    // Step 3.
                    value: dropdownValue,
                    // Step 4.
                    items: <String>['Male', 'Female']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: FontTypes.textStyle16),
                      );
                    }).toList(),
                    // Step 5.
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                  SizedBox(
                    height: Sizes.height(context) * 0.03,
                  ),
                  AuthCustomize(
                    onChanged: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'this is field is required';
                      } else if (!RegExp(
                        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                      ).hasMatch(value)) {
                        return 'Your password is weak';
                      } else if (value != passwordController.text) {
                        return 'has not match';
                      }
                      return null;
                    },
                    labelText: 'Hardware Id',
                    hintText: 'Enter your hardware id',
                    obscureText: false,
                    controller: hardwareIdController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: Sizes.height(context) * 0.1),
                  ButtonCustomization(
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          Provider.of<SignupProvider>(context, listen: false)
                              .signupCreation(
                                  emailAddress: emailController.text,
                                  password: passwordController.text);
                          addUserData();
                          AwesomeDialog(
                              context: context,
                              body:
                                  Center(child: Image.asset(AssetData.success)),
                              title: 'Success',
                              desc: 'Please verify your account from your mail',
                              btnOkColor: Styles.kColor,
                              btnOkOnPress: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignInView()));
                              }).show();
                        }
                      },
                      colorButton: Styles.kColor,
                      text: 'Get Started',
                      focusColor: Colors.lightGreen,
                      buttonHeight: Sizes.height(context) * 0.07,
                      hoverColor: Colors.green,
                      disabledColor: Colors.grey,
                      buttonWidth: Sizes.width(context),
                      borderRadius: 8),
                  SizedBox(
                    height: Sizes.height(context) * 0.02,
                  ),
                  CheckHaveAccount(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInView()));
                      },
                      text: 'Already have an account?',
                      signText: 'Sign in'),
                  SizedBox(
                    height: Sizes.height(context) * 0.03,
                  ),
                  TextWithBorder(
                      height: Sizes.height(context) * 0.002,
                      width: Sizes.width(context) * 0.07,
                      borderWidth: 1,
                      text: 'Create your account quickly with'),
                  SizedBox(
                    height: Sizes.height(context) * 0.03,
                  ),
                  const SignWithPlatformAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
