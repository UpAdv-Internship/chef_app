import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_stepper/stepper.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';
import 'package:up_dev_chef_app/core/utils/app_router.dart';
import 'package:up_dev_chef_app/core/utils/app_strings.dart';
import 'package:up_dev_chef_app/core/utils/commons.dart';
import 'package:up_dev_chef_app/features/auth/presentation/components/signup_step1.dart';
import 'package:up_dev_chef_app/features/auth/presentation/components/signup_step2.dart';
import 'package:up_dev_chef_app/features/auth/presentation/components/signup_step3.dart';
import 'package:up_dev_chef_app/features/auth/presentation/components/signup_step4.dart';

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
          leading: IconButton(
            onPressed: () {
              navigateReplacment(context: context, route: Routes.login);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
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
            //! Stepper Body
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    switch (currentStep) {
                      case 0:
                        return const SignUpStep1();
                      case 1:
                        return const SignUpStep2();
                      case 2:
                        return const SignUpStep3();
                      case 3:
                        return const SignUpStep4();
                      default:
                    }
                    return null;
                  },
                ),
              ),
            ),

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
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
