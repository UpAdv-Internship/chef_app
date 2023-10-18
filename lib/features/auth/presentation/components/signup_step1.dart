import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_dev_chef_app/core/Widgets/custom_text_field.dart';
import 'package:up_dev_chef_app/core/utils/app_strings.dart';
import 'package:up_dev_chef_app/features/auth/presentation/cubits/cubit/signup_cubit.dart';

class SignUpStep1 extends StatelessWidget {
  const SignUpStep1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignupCubit>(context);
    return Form(
      key: signupCubit.signUpFormKey,
      child: Column(
        children: [
          // Name Text Field
          CustomTextFormField(
            controller: signupCubit.nameTextEditingController,
            hint: AppStrings.name,
          ),
          const SizedBox(height: 10),
          // Phone Text Field
          CustomTextFormField(
            controller: signupCubit.phoneTextEditingController,
            hint: AppStrings.phoneNumber,
          ),
          const SizedBox(height: 10),
          // Email Text Field
          CustomTextFormField(
            controller: signupCubit.emailTextEditingController,
            hint: AppStrings.email,
          ),
          const SizedBox(height: 10),
          // Password Text Field
          CustomTextFormField(
            controller: signupCubit.passwordTextEditingController,
            hint: AppStrings.password,
            showSuffix: true,
          ),
          const SizedBox(height: 10),
          // Password Text Field
          CustomTextFormField(
            controller: signupCubit.confirmPasswordTextEditingController,
            hint: AppStrings.confirmPassword,
            showSuffix: true,
          ),
        ],
      ),
    );
  }
}
