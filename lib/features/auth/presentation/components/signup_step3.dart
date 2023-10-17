
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_dev_chef_app/core/Widgets/custom_text_field.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';
import 'package:up_dev_chef_app/core/utils/app_strings.dart';

class SignUpStep3 extends StatelessWidget {
  const SignUpStep3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          hint:
              '${AppStrings.governorate}.${AppStrings.city}.${AppStrings.location}',
          controller: TextEditingController(),
        ),
        SizedBox(height: 10.h),
        //! Auto Location
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.map,
                color: AppColors.primary,
              ),
            ),
            const Spacer(),
            const Text(AppStrings.address),
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
          hint: AppStrings.minRequestsNum,
          controller: TextEditingController(),
        ),
      ],
    );
  }
}

