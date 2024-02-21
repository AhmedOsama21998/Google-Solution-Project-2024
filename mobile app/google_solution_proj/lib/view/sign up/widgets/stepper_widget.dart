import 'package:flutter/material.dart';
import 'package:google_solution_proj/config/sizes.dart';
import 'package:google_solution_proj/style/font_types.dart';
import 'package:google_solution_proj/style/styles.dart';
import 'package:google_solution_proj/view/sign%20in/sign%20in_view.dart';
import 'package:google_solution_proj/view/sign%20up/sign_up_view.dart';
import 'package:im_stepper/stepper.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int activeStep = 0;
  int upperBound = 2;
  headerText() {
    switch (activeStep) {
      case 1:
        return SignInView();

      case 2:
        return SignUpView();
      default:
        return SignInView();
    }
  }

  Widget header() {
    return headerText();
  }

  Widget nextButton() {
    return ElevatedButton(
      onPressed: () {
        // Increment activeStep, when the next button is tapped. However, check for upper bound.
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        }
      },
      child: Text('Next'),
    );
  }

  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: Text('Prev'),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Icon> steps = const [
      Icon(Icons.email_outlined),
      Icon(Icons.lock_outline),
      Icon(Icons.person_outline),
    ];
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
                    style:
                        FontTypes.textStyle24.copyWith(color: Styles.kColor)),
              ],
            ),
            SizedBox(
              height: Sizes.height(context) * 0.02,
            ),
            Center(
              child: Text(
                'Please enter your email and we will send \n \t a confirmation code to your email',
                style: FontTypes.textStyle16.copyWith(color: Colors.grey),
              ),
            ),
            IconStepper(
              activeStepBorderColor: Styles.kColor,
              activeStepColor: Colors.transparent,
              stepColor: Colors.transparent,
              icons: steps,
              activeStep: activeStep,
              onStepReached: (index) => setState(() => activeStep = index),
            ),
            SizedBox(
              height: Sizes.height(context) * 0.02,
            ),
            header()
            // Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             previousButton(),
            //             nextButton(),
            //           ],
            //         ),
          ],
        ),
      ),
    );
  }
}
