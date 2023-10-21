import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_dev_chef_app/core/Widgets/custom_text_field.dart';
import 'package:up_dev_chef_app/core/utils/app_strings.dart';
import 'package:up_dev_chef_app/features/auth/presentation/cubits/cubit/signup_cubit.dart';
import 'package:up_dev_chef_app/features/auth/presentation/cubits/cubit/signup_state.dart';

class SignUpStep1 extends StatelessWidget {
  const SignUpStep1({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {},
      builder: (context, state) {
        final signupCubit = BlocProvider.of<SignupCubit>(context);
        return Form(
          key: signupCubit.signUpStep1FormKey,
          child: Column(
            children: [
              //! Name Text Field
              CustomTextFormField(
                onChanged: (name) {
                  signupCubit.name = name;
                },
                controller: signupCubit.nameTextEditingController,
                hint: AppStrings.name,
              ),
              //! Brand Name Text Field
              const SizedBox(height: 10),
              CustomTextFormField(
                onChanged: (brandName) {
                  signupCubit.brandName = brandName;
                },
                controller: signupCubit.brandNameTextEditingController,
                hint: AppStrings.brandName,
              ),
              const SizedBox(height: 10),
              //! Phone Text Field
              CustomTextFormField(
                onChanged: (phone) {
                  signupCubit.phone = phone;
                },
                controller: signupCubit.phoneTextEditingController,
                hint: AppStrings.phoneNumber,
              ),
              const SizedBox(height: 10),
              //! Email Text Field
              CustomTextFormField(
                onChanged: (email) {
                  signupCubit.email = email;
                },
                controller: signupCubit.emailTextEditingController,
                hint: AppStrings.email,
              ),
              const SizedBox(height: 10),
              //! Password Text Field
              CustomTextFormField(
                hint: AppStrings.password,
                controller: signupCubit.passwordTextEditingController,
                keyboardType: TextInputType.visiblePassword,
                showSuffix: true,
                suffixIcon: signupCubit.suffixIcon(),
                isObscure: signupCubit.obscure,

                // changeSuffix: BlocProvider.of<LoginCubit>(context).changeSuffixIcon(),
              ),
              const SizedBox(height: 10),
              //! Password Confirm Text Field
              CustomTextFormField(
                onChanged: (confirmPassword) {
                  signupCubit.confirmPassword = confirmPassword;
                },
                controller:
                    signupCubit.confirmPasswordTextEditingController,
                hint: AppStrings.confirmPassword,
                showSuffix: true,
                suffixIcon: signupCubit.confirmSuffixIcon(),
                isObscure: signupCubit.confirmObscure,
              ),

              const SizedBox(height: 50),
              //!Buttons
              ElevatedButton(
                onPressed: () {
                  if (signupCubit.signUpStep1FormKey.currentState!
                      .validate()) {
                    signupCubit.increaseStepperIndex();
                  }
                },
                child: const Text(AppStrings.next),
              ),
            ],
          ),
        );
      },
    );
  }
}
