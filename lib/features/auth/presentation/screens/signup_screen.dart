import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im_stepper/stepper.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';
import 'package:up_dev_chef_app/core/utils/app_router.dart';
import 'package:up_dev_chef_app/core/utils/app_strings.dart';
import 'package:up_dev_chef_app/core/utils/commons.dart';
import 'package:up_dev_chef_app/features/auth/presentation/components/signup_step1.dart';
import 'package:up_dev_chef_app/features/auth/presentation/components/signup_step2.dart';
import 'package:up_dev_chef_app/features/auth/presentation/components/signup_step3.dart';
import 'package:up_dev_chef_app/features/auth/presentation/components/signup_step4.dart';
import 'package:up_dev_chef_app/features/auth/presentation/cubits/cubit/signup_cubit.dart';
import 'package:up_dev_chef_app/features/auth/presentation/cubits/cubit/signup_state.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = BlocProvider.of<SignupCubit>(context);
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                    activeStep: signUpCubit.currentStep,
                    activeStepColor: AppColors.orange,
                    stepReachedAnimationEffect: Curves.ease,
                    enableStepTapping: false,
                    lineLength: 50,
                  ),
                ),
                //! Stepper Body
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        switch (signUpCubit.currentStep) {
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
              ],
            ),
          ),
        );
      },
    );
  }
}
