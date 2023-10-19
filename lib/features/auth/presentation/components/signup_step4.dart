import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:up_dev_chef_app/core/Widgets/custom_text_field.dart';
import 'package:up_dev_chef_app/core/common/commons.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';
import 'package:up_dev_chef_app/core/utils/app_strings.dart';
import 'package:up_dev_chef_app/features/auth/presentation/cubits/cubit/signup_cubit.dart';
import 'package:up_dev_chef_app/features/auth/presentation/cubits/cubit/signup_state.dart';

class SignUpStep4 extends StatelessWidget {
  const SignUpStep4({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignupCubit>(context);
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          showTwist(messege: "Sign Up Success", state: ToastStates.success);
        } else if (state is SignUpFailureState) {
          showTwist(messege: state.errMessage, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        return Form(
          key: signupCubit.signUpStep4FormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                AppStrings.canWeKnowYouMore,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              //!Discription
              CustomTextFormField(
                onChanged: (disc) {
                  signupCubit.disc = disc;
                },
                hint: AppStrings.writeHere,
                controller: signupCubit.discTextEditingController,
              ),
              SizedBox(height: 20.h),
              //! Requrements Documents
              Text(
                AppStrings.requestsDocuments,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              //! Id from front
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      pickImage(ImageSource.camera)
                          .then((value) => signupCubit.frontId = value);
                    },
                    icon: const Icon(
                      Icons.camera_alt_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    AppStrings.notionalIdFormFront,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                        ),
                  ),
                ],
              ),
              //! Id from back
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      pickImage(ImageSource.camera)
                          .then((value) => signupCubit.backId = value);
                    },
                    icon: const Icon(
                      Icons.camera_alt_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    AppStrings.notionalIdFormback,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                        ),
                  ),
                ],
              ),
              //! Medical Certificate
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      pickImage(ImageSource.camera).then(
                          (value) => signupCubit.healthCertificate = value);
                    },
                    icon: const Icon(
                      Icons.camera_alt_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    AppStrings.medicalCertificate,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                        ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              const Text(AppStrings.medicalCertificateCanExtractFromNerest),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (signupCubit.signUpStep4FormKey.currentState!
                          .validate()) {
                        signupCubit.signUp();
                      }
                    },
                    child: const Text(AppStrings.save),
                  ),
                  SizedBox(width: 20.w),
                  ElevatedButton(
                    onPressed: () {
                      signupCubit.decreaseStepperIndex();
                    },
                    child: const Text(AppStrings.previous),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
