import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:up_dev_chef_app/core/utils/app_assets.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';

class CustomFileImage extends StatelessWidget {
  const CustomFileImage({super.key, this.image});
  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return image != null
        ? CircleAvatar(
            radius: 75,
            backgroundImage: FileImage(
              File(image!.path),
            ),
          )
        : CircleAvatar(
            radius: 100,
            backgroundColor: AppColors.orange.withOpacity(0.15),
            child: Image.asset(
              AppAssets.lock,
              width: 150,
            ),
          );
  }
}

class CustomImages extends StatelessWidget {
  const CustomImages({
    super.key,
    required this.imgPath,
    this.height,
    this.width,
    this.fit,
  });
  final String imgPath;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imgPath,
      fit: fit,
      height: height,
      width: double.infinity,
    );
  }
}
