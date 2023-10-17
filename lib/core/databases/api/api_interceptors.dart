

import 'package:dio/dio.dart';
import 'package:up_dev_chef_app/core/databases/api/end_points.dart';
import 'package:up_dev_chef_app/core/databases/cache/cache_helper.dart';
import 'package:up_dev_chef_app/core/services/service_locator.dart';


class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers[Apikeys.token] = sl<CacheHelper>().getData(key: Apikeys.token) != null
        ? 'FOODAPI ${sl<CacheHelper>().getData(key: Apikeys.token)}'
        : null;
    

    super.onRequest(options, handler);
  }
}
