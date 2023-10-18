
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_dev_chef_app/core/utils/app_assets.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';
import 'package:up_dev_chef_app/core/utils/app_strings.dart';

class SignUpStep2 extends StatelessWidget {
  const SignUpStep2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50.h),
          //! Picture picking
          Stack(
            children: [
              CircleAvatar(
                radius: 100.w,
                // backgroundImage: const AssetImage(AppAssets.lock),
                backgroundColor: AppColors.orange.withOpacity(0.15),
                child: Image.asset(
                  AppAssets.lock,
                  width: 150.w,
                ),
              ),
              Positioned(
                bottom: 0,
                child: InkWell(
                  onTap: () {},
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
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

