import 'package:flutter/material.dart';
import 'package:up_dev_chef_app/core/Widgets/custom_text_field.dart';
import 'package:up_dev_chef_app/core/utils/app_strings.dart';

// ignore: must_be_immutable
class UpdateProfileScreen extends StatelessWidget {
   UpdateProfileScreen({super.key});
  TextEditingController updateEmailController =  TextEditingController();
  TextEditingController updatePasswordController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.updateProfile),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              CustomTextFormField(hint: AppStrings.email, controller: updateEmailController),
              const SizedBox(height: 15,),
              CustomTextFormField(hint: AppStrings.password, controller: updatePasswordController),
            ],
          ),
        ),
      ),
    );
  }
}