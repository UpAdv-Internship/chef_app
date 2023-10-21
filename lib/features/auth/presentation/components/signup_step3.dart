import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:up_dev_chef_app/core/Widgets/custom_text_field.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';
import 'package:up_dev_chef_app/core/utils/app_strings.dart';
import 'package:up_dev_chef_app/features/auth/presentation/cubits/cubit/signup_cubit.dart';
import 'package:up_dev_chef_app/features/auth/presentation/cubits/cubit/signup_state.dart';

class SignUpStep3 extends StatelessWidget  {
  const SignUpStep3({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignupCubit>(context);

    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: signupCubit.signUpStep3FormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 20.h),
              /*
              //! Enter Address
              Text(
                AppStrings.enterYourLocation,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 25,
                    ),
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                onChanged: (location) {
                  signupCubit.location = location;
                },
                hint:
                    '${AppStrings.governorate}.${AppStrings.city}.${AppStrings.location}',
                controller: signupCubit.locationTextEditingController,
              ),
              SizedBox(height: 10.h),
              */
              //! Auto Location
              signupCubit.isLoading
                  ? const CircularProgressIndicator()
                  : Row(
                      children: [
                        IconButton(
                          onPressed: () async {

                              signupCubit.isLoading = true;


                              signupCubit.currentPosition =
                              await signupCubit.getPosition();

                              signupCubit.getAdress(
                                  signupCubit.currentPosition!.latitude,
                                  signupCubit.currentPosition!.longitude);

                              signupCubit.isLoading = false;

                          },
                          icon: const Icon(
                            Icons.map,
                            color: AppColors.primary,
                          ),
                        ),
                        const Spacer(),
                        //const Text(AppStrings.address),
                        if (signupCubit.currentAddress != null)
                          SizedBox(
                              width: 300,
                              child: Text(
                                signupCubit.currentAddress!,
                                style: const TextStyle(fontSize: 20),
                              )),
                      ],
                    ),
              SizedBox(height: 10.h),
              //! Requests Requirements
              Text(
                AppStrings.requestsConditions,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 25,
                    ),
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                keyboardType: TextInputType.number,
                onChanged: (minCharge) {
                  signupCubit.minCharge = minCharge;
                },
                hint: AppStrings.minRequestsNum,
                controller: signupCubit.minChargeTextEditingController,
              ),

              const SizedBox(height: 120),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (signupCubit.signUpStep3FormKey.currentState!
                            .validate()) {
                          signupCubit.increaseStepperIndex();
                        }
                      },
                      child: const Text(AppStrings.next)),
                  const SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        signupCubit.decreaseStepperIndex();
                      },
                      child: const Text(AppStrings.previous)),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
