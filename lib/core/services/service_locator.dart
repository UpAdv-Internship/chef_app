import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:up_dev_chef_app/core/databases/api/api_consumer.dart';
import 'package:up_dev_chef_app/core/databases/api/dio_consumer.dart';
import 'package:up_dev_chef_app/core/databases/cache/cache_helper.dart';
import 'package:up_dev_chef_app/features/auth/data/repository/auth_repo.dart';
import 'package:up_dev_chef_app/features/auth/presentation/cubits/cubit/login_cubit.dart';
import 'package:up_dev_chef_app/features/profile/data/repository/profile_repository.dart';
import 'package:up_dev_chef_app/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:up_dev_chef_app/features/auth/presentation/cubits/cubit/signup_cubit.dart';

final sl = GetIt.instance;
void initServiceLocator() {
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => AuthRepository());
  sl.registerLazySingleton(() => ProfileRepo());
  sl.registerLazySingleton(() => LoginCubit(sl()));
  sl.registerLazySingleton(() => ProfileCubit(sl()));
  sl.registerLazySingleton(() => SignupCubit(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
