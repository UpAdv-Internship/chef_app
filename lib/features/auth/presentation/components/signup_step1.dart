
import 'package:flutter/material.dart';
import 'package:up_dev_chef_app/core/Widgets/custom_text_field.dart';
import 'package:up_dev_chef_app/core/utils/app_strings.dart';

class SignUpStep1 extends StatelessWidget {
  const SignUpStep1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // Name Text Field
          CustomTextFormField(
            controller: TextEditingController(),
            hint: AppStrings.name,
          ),
          const SizedBox(height: 10),
          // Phone Text Field
          CustomTextFormField(
            controller: TextEditingController(),
            hint: AppStrings.phoneNumber,
          ),
          const SizedBox(height: 10),
          // Email Text Field
          CustomTextFormField(
            controller: TextEditingController(),
            hint: AppStrings.email,
          ),
          const SizedBox(height: 10),
          // Password Text Field
          CustomTextFormField(
            controller: TextEditingController(),
            hint: AppStrings.password,
            showSuffix: true,
          ),
          const SizedBox(height: 10),
          // Password Text Field
          CustomTextFormField(
            controller: TextEditingController(),
            hint: AppStrings.confirmPassword,
            showSuffix: true,
          ),
        ],
      ),
    );
  }
}

