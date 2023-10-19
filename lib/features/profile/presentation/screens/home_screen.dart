import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_dev_chef_app/core/utils/app_assets.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';
import 'package:up_dev_chef_app/core/utils/app_router.dart';
import 'package:up_dev_chef_app/core/utils/commons.dart';
import 'package:up_dev_chef_app/core/widgets/custom_text_icon_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              // fit: StackFit.loose,
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  AppAssets.backgroundTwo,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
                Positioned(
                  top: 110,
                  right: 120,
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 75,
                        backgroundImage: AssetImage(AppAssets.profile),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Mahmoud',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: AppColors.black),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'mahmoudmagdy@gmail.com',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: AppColors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
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
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.grey,
                            ),
                            CustomTextButtonIcon(
                              onPressed: () {
                                navigate(
                                    context: context,
                                    route: Routes.updateProfileScreen);
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
                                'تسجيل الخروج',
                                style: TextStyle(color: AppColors.grey),
                              ),
                              label: const Icon(
                                Icons.logout,
                              ),
                            ),
                          ],
                        ),
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
