import 'package:flutter/material.dart';
import 'package:up_dev_chef_app/core/theme/app_theme.dart';
import 'package:up_dev_chef_app/core/utils/app_router.dart';

class ChefApp extends StatelessWidget {
  const ChefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: getAppTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.intitlRoute,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
