import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:up_dev_chef_app/core/Widgets/custom_text_field.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';
import 'package:up_dev_chef_app/core/utils/app_strings.dart';

// ignore: must_be_immutable
class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  File? _selectedImage;

  TextEditingController updateEmailController = TextEditingController();

  TextEditingController updatePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.updateProfile),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Stack(
                children: [
                  _selectedImage != null
                      ? CircleAvatar(
                          radius: 100,
                          backgroundImage: FileImage(_selectedImage!),
                        )
                      : const CircleAvatar(
                          radius: 100,
                          backgroundImage:
                              AssetImage("assets/images/profile.png"),
                        ),
                  Positioned.directional(
                      textDirection: Directionality.of(context),
                      bottom: 0,
                      end: 0,
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  backgroundColor: AppColors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // camera
                                      ListTile(
                                        leading: const Icon(
                                          Icons.camera_alt,
                                          color: AppColors.primary,
                                        ),
                                        title: const Text(
                                          AppStrings.camera,
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: AppColors.primary),
                                        ),
                                        onTap: () {
                                          _takeImage();
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      //gallary

                                      ListTile(
                                        leading: const Icon(
                                          Icons.photo,
                                          color: AppColors.primary,
                                        ),
                                        title: const Text(
                                          AppStrings.gallery,
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: AppColors.primary),
                                        ),
                                        onTap: () {
                                          _pickImage();
                                        },
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                        icon: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Icon(
                            Icons.edit,
                            color: AppColors.white,
                          ),
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                  hint: AppStrings.email, controller: updateEmailController),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                  hint: AppStrings.password,
                  controller: updatePasswordController),
            ],
          ),
        ),
      ),
    );
  }

  Future _pickImage() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

  Future _takeImage() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}
