import 'package:dartz/dartz.dart';
import 'package:up_dev_chef_app/core/databases/api/api_consumer.dart';
import 'package:up_dev_chef_app/core/databases/api/end_points.dart';
import 'package:up_dev_chef_app/core/error/exception.dart';
import 'package:up_dev_chef_app/core/services/service_locator.dart';
import 'package:up_dev_chef_app/features/auth/data/models/login_model.dart';
import 'package:up_dev_chef_app/features/auth/data/models/signup_model.dart';

class AuthRepository {
  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoint.chefSignIn, data: {
        Apikeys.email: email,
        Apikeys.password: password,
      });
      return Right(LoginModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, SignUpModel>> signUP() async {
    try {
      final response =
          await sl<ApiConsumer>().post(EndPoint.chefSignUp, data: {});
      return Right(SignUpModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
