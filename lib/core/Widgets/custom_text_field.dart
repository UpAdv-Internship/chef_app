import 'package:flutter/material.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    required this.controller,
    this.isObscure = false,
    this.showSuffix = false,
    this.keyboardType,
    this.validator,
    this.suffixIcon,
    this.changeSuffix, 
    this.onChanged,
  });
  final String hint;
  final TextEditingController controller;
  final bool isObscure;
  final bool showSuffix;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function()? changeSuffix;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator ??
          (value) {
            if (value!.isEmpty) {
              return "هذا الحقل مطلوب";
            } else {
              return null;
            }
          },
      controller: controller,
      onChanged: onChanged,
      cursorColor: AppColors.orange,
      obscureText: isObscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.orange,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.orange,
          ),
        ),
      ),
    );
  }
}
