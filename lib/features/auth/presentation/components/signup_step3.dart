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

class SignUpStep3 extends StatefulWidget {
  const SignUpStep3({super.key});

  @override
  State<SignUpStep3> createState() => _SignUpStep3State();
}

class _SignUpStep3State extends State<SignUpStep3> {
  Position? _currentPosition;
  String? _currentAddress;
  bool isLoading = false;

  Future<Position> _getPosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location not available !');
      }
    } else {
      if (kDebugMode) {
        print('Location not available !');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  void _getAdress(latitude, longitude) async {
    try {
      List<Placemark> placemark = await GeocodingPlatform.instance
          .placemarkFromCoordinates(latitude, longitude);

      Placemark place = placemark[0];

      setState(() {
        _currentAddress = '${place.country},${place.locality},${place.street}';
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

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
              //! Auto Location
              isLoading
                  ? const CircularProgressIndicator()
                  : Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            _currentPosition = await _getPosition();

                            _getAdress(_currentPosition!.latitude,
                                _currentPosition!.longitude);
                            setState(() {
                              isLoading = false;
                            });
                          },
                          icon: const Icon(
                            Icons.map,
                            color: AppColors.primary,
                          ),
                        ),
                        const Spacer(),
                        //const Text(AppStrings.address),
                        if (_currentAddress != null)
                          SizedBox(
                              width: 300,
                              child: Text(
                                _currentAddress!,
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
