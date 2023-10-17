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
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              //! Stepper
              SizedBox(                
                child: IconStepper(                  
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
              //! Based on currenStep number write body here
              //
              //
              const Spacer(),
              //! Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Next Button
                  ElevatedButton(
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
                  // Previous Button
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
        ),
      ),
    );
  }
}
