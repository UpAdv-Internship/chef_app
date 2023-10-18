import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_dev_chef_app/core/Widgets/custom_text_field.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';
import 'package:up_dev_chef_app/core/utils/app_strings.dart';

class SignUpStep4 extends StatelessWidget {
  const SignUpStep4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        //!
        Text(
          AppStrings.canWeKnowYouMore,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
        ),
        CustomTextFormField(
          hint: AppStrings.writeHere,
          controller: TextEditingController(),
        ),
        SizedBox(height: 20.h),
        //! Requrements Documents
        Text(
          AppStrings.requestsDocuments,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
        ),
        // Id from front
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt_rounded,
                color: AppColors.primary,
              ),
            ),
            const Spacer(),
            Text(
              AppStrings.notionalIdFormFront,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                  ),
            ),
          ],
        ),
        // Id from back
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt_rounded,
                color: AppColors.primary,
              ),
            ),
            const Spacer(),
            Text(
              AppStrings.notionalIdFormback,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                  ),
            ),
          ],
        ),
        // Medical Certificate
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt_rounded,
                color: AppColors.primary,
              ),
            ),
            const Spacer(),
            Text(
              AppStrings.medicalCertificate,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                  ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        const Text(AppStrings.medicalCertificateCanExtractFromNerest),
      ],
    );
  }
}
