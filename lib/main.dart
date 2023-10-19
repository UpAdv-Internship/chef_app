import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_dev_chef_app/app/app.dart';
import 'package:up_dev_chef_app/core/databases/cache/cache_helper.dart';
import 'package:up_dev_chef_app/core/services/service_locator.dart';
import 'package:up_dev_chef_app/features/auth/presentation/cubits/cubit/login_cubit.dart';
import 'package:up_dev_chef_app/features/auth/presentation/cubits/cubit/signup_cubit.dart';
import 'package:up_dev_chef_app/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<CacheHelper>().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<LoginCubit>()),
        BlocProvider(create: (context) => sl<SignupCubit>()),
        BlocProvider(create: (context) => sl<ProfileCubit>()..getChefData()),
      ],
      child: const ChefApp(),
    ),
  );
}
