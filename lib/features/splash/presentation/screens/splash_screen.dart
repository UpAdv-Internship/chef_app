import 'package:flutter/material.dart';
import 'package:up_dev_chef_app/core/utils/app_assets.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';
import 'package:up_dev_chef_app/core/utils/app_router.dart';
import 'package:up_dev_chef_app/core/utils/app_strings.dart';
import 'package:up_dev_chef_app/core/utils/commons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateAfterThreeSeconds();
    super.initState();
  }

  void navigateAfterThreeSeconds() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      navigate(context: context, route: Routes.login);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Image.asset(
            AppAssets.background,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.appLogo),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  AppStrings.chafApp,
                  style: TextStyle(fontSize: 24, color: AppColors.white),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
