import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:up_dev_chef_app/core/Widgets/custom_text_field.dart';
import 'package:up_dev_chef_app/core/common/commons.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';
import 'package:up_dev_chef_app/core/utils/app_router.dart';
import 'package:up_dev_chef_app/core/utils/app_strings.dart';
import 'package:up_dev_chef_app/core/utils/commons.dart';
import 'package:up_dev_chef_app/features/profile/components/image_picker_dialog.dart';
import 'package:up_dev_chef_app/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:up_dev_chef_app/features/profile/presentation/cubits/profile_cubit/profile_state.dart';

// ignore: must_be_immutable
class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.updateProfile),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state is UpdateProfileSuccessState) {
                  navigateReplacment(context: context, route: Routes.home);
                }
              },
              builder: (context, state) {
                final profileCubit = BlocProvider.of<ProfileCubit>(context);
                return Form(
                  key: profileCubit.updateProfileKey,
                  child: Column(
                    children: [
                      //! Image
                      SizedBox(
                        width: 150.w,
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: profileCubit.image != null
                                    ? CircleAvatar(
                                      radius: 75,
                                        backgroundImage: FileImage(
                                          File(profileCubit.image!.path),
                                        ),
                                      )
                                    : CircleAvatar(
                                        radius: 75,
                                        backgroundImage: NetworkImage(
                                            profileCubit
                                                .getChefModel!.profilePic)
                                        // backgroundImage: FileImage(
                                        //   File(profileCubit.image!.path),
                                        // ),
                                        )),
                            Positioned.directional(
                              textDirection: Directionality.of(context),
                              bottom: 0,
                              end: 0,
                              child: MaterialButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ImagePackerDialog(
                                        cameraOnTap: () {
                                          Navigator.pop(context);
                                          pickImage(ImageSource.camera).then(
                                              (value) => profileCubit
                                                  .takePhoto(value));
                                        },
                                        galleryOnTap: () {
                                          Navigator.pop(context);
                                          pickImage(ImageSource.gallery).then(
                                              (value) => profileCubit
                                                  .takePhoto(value));
                                        },
                                      );
                                    },
                                  );
                                },
                                color: AppColors.primary,
                                minWidth: 10,
                                height: 35,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  color: AppColors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      //! Name TextField
                      CustomTextFormField(
                        hint: AppStrings.name,
                        controller: profileCubit.nameController,
                      ),
                      const SizedBox(height: 15),
                      //! Phone TextField
                      CustomTextFormField(
                        hint: AppStrings.phoneNumber,
                        controller: profileCubit.phoneController,
                      ),
                      const SizedBox(height: 15),
                      //! Brand Name TextField
                      CustomTextFormField(
                        hint: AppStrings.brandName,
                        controller: profileCubit.brandNameController,
                      ),
                      const SizedBox(height: 15),
                      //! Minimum Charge TextField
                      CustomTextFormField(
                        hint: AppStrings.minimumCharge,
                        controller: profileCubit.minChargeController,
                      ),
                      const SizedBox(height: 15),
                      //! Descreption Charge TextField
                      CustomTextFormField(
                        hint: AppStrings.description,
                        controller: profileCubit.discController,
                      ),
                      const SizedBox(height: 15),
                      //! Location TextField
                      CustomTextFormField(
                        hint: AppStrings.location,
                        controller: profileCubit.locationController,
                      ),
                      const SizedBox(height: 15),
                      //! Update Button
                      ElevatedButton(
                        onPressed: () {
                          if (profileCubit.updateProfileKey.currentState!
                              .validate()) {
                                    print(profileCubit.image!.name);

                            profileCubit.updateProfile();
                            // state is UpdateProfileLoadingState
                            //     ? const CircularProgressIndicator()
                            //     : profileCubit.getChefData();
                                
                          }
                          // profileCubit.updateProfile();
                          // state is UpdateProfileLoadingState
                          //       ? const Center(child: CircularProgressIndicator())
                          //       : profileCubit.getChefData();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(double.maxFinite, 50.h),
                        ),
                        child: const Text(AppStrings.save),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
