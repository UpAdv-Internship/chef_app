import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:up_dev_chef_app/core/common/commons.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';
import 'package:up_dev_chef_app/core/utils/app_strings.dart';
import 'package:up_dev_chef_app/features/auth/presentation/components/custom_file_image.dart';
import 'package:up_dev_chef_app/features/auth/presentation/cubits/cubit/signup_cubit.dart';
import 'package:up_dev_chef_app/features/auth/presentation/cubits/cubit/signup_state.dart';

class SignUpStep2 extends StatelessWidget {
  const SignUpStep2({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignupCubit>(context);
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              //! Picture picking
              Stack(
                children: [
                  CustomFileImage(image: signupCubit.profilePic),
                  Positioned(
                    bottom: 0,
                    child: InkWell(
                      onTap: () {
                        pickImage(ImageSource.camera).then(
                          (value) => signupCubit.changeImage(value),
                        );
                      },
                      child: const CircleAvatar(
                        backgroundColor: AppColors.grey,
                        child: Icon(
                          Icons.camera_alt,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                AppStrings.logoOrPicture,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                AppStrings.choosePicture,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18),
              ),
              const SizedBox(height: 120),
              //!Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (signupCubit.profilePic != null) {
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
