import 'package:flutter/material.dart';
import 'package:up_dev_chef_app/core/theme/app_theme.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';
import 'package:up_dev_chef_app/core/utils/app_router.dart';
import 'package:up_dev_chef_app/core/utils/commons.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isVis = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //image and welcome text

              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(AppAssets.backgroundTwo),
                  const Center(
                      child: Text(
                    AppStrings.welcome,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white),
                  ))
                ],
              ),

              const SizedBox(
                height: 100,
              ),
              //two texts Email and password
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    // Email

                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: AppColors.primary,
                      decoration: InputDecoration(
                          hintText: AppStrings.email,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.grey),
                              borderRadius: BorderRadius.circular(10))),
                      validator: (data) {
                        if (data!.isEmpty || !data.contains('@gmail.com')) {
                          return AppStrings.pleaseEnterValidEmail;
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 32,
                    ),

                    // Passsword

                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      obscureText: isVis,
                      cursorColor: AppColors.primary,
                      decoration: InputDecoration(
                          hintText: AppStrings.password,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVis = !isVis;
                              });
                            },
                            icon: isVis
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: AppColors.primary,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: AppColors.primary,
                                  ),
                          )),
                      validator: (data) {
                        if (data!.length < 6 || data.isEmpty) {
                          return AppStrings.pleaseEnterValidPassword;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),

                    // ForgetPass

                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            AppStrings.forgetPass,
                            style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),

                    //elevated button

                    SizedBox(
                      height: 50,
                      width: 190,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: getAppTheme().elevatedButtonTheme.style,
                        child: const Text(AppStrings.login),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //new account + Text

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              navigateReplacment(context: context, route: Routes.signUp);
                            },
                            child: const Text(
                              AppStrings.createEmail,
                              style: TextStyle(color: AppColors.primary),
                            )),
                        const Text(AppStrings.dontHaveEmail)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
