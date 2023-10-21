import 'package:flutter/material.dart';
import 'package:up_dev_chef_app/core/utils/app_assets.dart';
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
    // BlocProvider.of<GlobalCubit>(context).getChefData();
    super.initState();
  }

  void navigateAfterThreeSeconds() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      //  await sl<CacheHelper>().getData(
      //           key: Apikeys.token,
      //         ) ==
      //         null
      //     ? navigate(context: context, route: Routes.login)
      //     : navigate(context: context, route: Routes.home);
      navigateReplacment(context: context, route: Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        fit: StackFit.expand,
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
                Text(
                  AppStrings.chafApp,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
