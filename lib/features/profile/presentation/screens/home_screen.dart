import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_dev_chef_app/core/utils/app_assets.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';
import 'package:up_dev_chef_app/core/utils/app_router.dart';
import 'package:up_dev_chef_app/core/utils/commons.dart';
import 'package:up_dev_chef_app/core/widgets/custom_text_icon_button.dart';
import 'package:up_dev_chef_app/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:up_dev_chef_app/features/profile/presentation/cubits/profile_cubit/profile_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                final profileCubit = BlocProvider.of<ProfileCubit>(context);
                return Stack(
                  // fit: StackFit.loose,
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      AppAssets.backgroundTwo,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                    Positioned(
                      top: 60.h,                      
                      child: Column(
                        children: [
                          // const CircleAvatar(
                          //   radius: 75,
                          //   backgroundImage: AssetImage(AppAssets.profile),
                          // ),
                          
                              CircleAvatar(
                                  radius: 80,
                                  backgroundImage: NetworkImage(profileCubit.getChefModel!.profilePic),
                                ),
            
                          SizedBox(
                            height: 5.h,
                          ),
                          state is GetChefDataLoadingState ?const CircleAvatar(): Text(
                            profileCubit.getChefModel!.name,
                        // context.read<ProfileCubit>().getChefModel!.email,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: AppColors.black),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                         state is GetChefDataLoadingState ?const CircleAvatar(): Text(
                            profileCubit.getChefModel!.email,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: AppColors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 100.h,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //تعديل الملف
                      InkWell(
                        onTap: () {
                          navigate(
                              context: context,
                              route: Routes.updateProfileScreen);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.grey,
                            ),
                            CustomTextButtonIcon(
                              onPressed: () {
                                // navigate(
                                //     context: context,
                                //     route: Routes.updateProfileScreen);
                              },
                              icon: const Text(
                                'تعديل الملف الشخصي',
                                style: TextStyle(color: AppColors.grey),
                              ),
                              label: const Icon(
                                Icons.person,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //تعديل كلمة السر
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.grey,
                            ),
                            CustomTextButtonIcon(
                              onPressed: () {},
                              icon: const Text(
                                'تعديل كلمة السر',
                                style: TextStyle(color: AppColors.grey),
                              ),
                              label: const Icon(
                                Icons.password,
                              ),
                            ),
                          ],
                        ),
                      ),

                      //تسجيل الخروج
                      BlocConsumer<ProfileCubit, ProfileState>(
                        listener: (context, state) {
                          if (state is LogoutSuccessState) {
                            navigateReplacment(
                                context: context, route: Routes.login);
                          }
                        },
                        builder: (context, state) {
                          return InkWell(
                            onTap: () {
                              BlocProvider.of<ProfileCubit>(context).logout();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.arrow_back_ios,
                                  color: AppColors.grey,
                                ),
                                CustomTextButtonIcon(
                                  onPressed: () {},
                                  icon: const Text(
                                    'تسجيل الخروج',
                                    style: TextStyle(color: AppColors.grey),
                                  ),
                                  label: const Icon(
                                    Icons.logout,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
