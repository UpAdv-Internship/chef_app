import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';
import 'package:up_dev_chef_app/core/utils/app_strings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.orange,
          title: const Text(AppStrings.createEmail),
        ),
        body: Column(
          children: [
            //! Stepper
            SizedBox(
              width: double.maxFinite,
              child: IconStepper(
                alignment: Alignment.center,
                enableNextPreviousButtons: false,
                icons: const [
                  Icon(Icons.person),
                  Icon(Icons.camera_alt_outlined),
                  Icon(Icons.flag),
                  Icon(Icons.document_scanner_outlined),
                ],
                activeStep: currentStep,
                activeStepColor: AppColors.orange,
                stepReachedAnimationEffect: Curves.ease,
                enableStepTapping: false,
                lineLength: 40,
              ),
            ),

            const Spacer(),
            //! Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: () {
                    currentStep == 3
                        ? null //! Add Navigator to home page
                        : setState(() {
                            currentStep++;
                          });
                  },
                  child: Text(
                      currentStep == 3 ? AppStrings.save : AppStrings.next),
                ),
                const SizedBox(width: 20),
                currentStep == 0
                    ? Container()
                    : ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentStep--;
                          });
                        },
                        child: const Text(AppStrings.previous),
                      ),
              ],
            ),
          ],
        ),
        // Theme(
        //   data: ThemeData(
        //     colorScheme: const ColorScheme.light(primary: AppColors.orange),
        //   ),
        //   child: Stepper(
        //     stepIconBuilder: (stepIndex, stepState) {

        //     },
        //     currentStep: currentStep,
        //     steps: getSteps(),
        //     // connectorColor: const MaterialStatePropertyAll(AppColors.black),
        //     type: StepperType.horizontal,
        //     elevation: 0,
        //     onStepContinue: () {
        //       if (currentStep == 3) {
        //         //! add Navigator to home screen
        //       } else {
        //         setState(() {
        //           currentStep += 1;
        //         });
        //       }
        //     },
        //     onStepCancel: currentStep == 0
        //         ? null
        //         : () => setState(
        //               () {
        //                 currentStep -= 1;
        //               },
        //             ),
        //     controlsBuilder: (context, details) {
        //       return Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: <Widget>[
        //           ElevatedButton(
        //             onPressed: details.onStepContinue,
        //             child: Text(
        //               currentStep == 3 ? AppStrings.save : AppStrings.next,
        //             ),
        //           ),
        //           const SizedBox(width: 20),
        //           currentStep == 0
        //               ? Container()
        //               : ElevatedButton(
        //                   onPressed: details.onStepCancel,
        //                   child: const Text(AppStrings.previous),
        //                 ),
        //         ],
        //       );
        //     },
        //   ),
        // ),
      ),
    );
  }
}
