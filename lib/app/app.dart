import 'package:flutter/material.dart';
import 'package:up_dev_chef_app/core/utils/app_router.dart';

class ChefApp extends StatelessWidget {
  const ChefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.intitlRoute,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
