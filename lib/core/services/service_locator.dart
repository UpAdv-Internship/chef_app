import 'package:get_it/get_it.dart';
import 'package:up_dev_chef_app/core/databases/cache/cache_helper.dart';

final sl = GetIt.instance;
void initServiceLocator() {
  sl.registerLazySingleton(() => CacheHelper());
}
