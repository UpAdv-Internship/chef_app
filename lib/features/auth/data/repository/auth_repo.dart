import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:up_dev_chef_app/core/common/commons.dart';
import 'package:up_dev_chef_app/core/databases/api/api_consumer.dart';
import 'package:up_dev_chef_app/core/databases/api/end_points.dart';
import 'package:up_dev_chef_app/core/error/exception.dart';
import 'package:up_dev_chef_app/core/services/service_locator.dart';
import 'package:up_dev_chef_app/features/auth/data/models/login_model.dart';
import 'package:up_dev_chef_app/features/auth/data/models/sigup_model.dart';

class AuthRepository {
  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    bool internetCheacker = await sl<InternetConnectionChecker>().hasConnection;

    if (internetCheacker == true) {
      try {
        final response =
            await sl<ApiConsumer>().post(EndPoint.chefSignIn, data: {
          Apikeys.email: email,
          Apikeys.password: password,
        });
        return Right(LoginModel.fromJson(response));
      } on ServerException catch (error) {
        return Left(error.errorModel.errorMessage);
      }
    }
    return const Left("NO Internet Connection");
  }

  Future<Either<String, SignUpModel>> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required String location,
    required String brandName,
    required String minCharge,
    required String disc,
    required XFile healthCertificate,
    required XFile frontId,
    required XFile backId,
    required XFile profilePic,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoint.chefSignUp,
        data: {
          Apikeys.name: name,
          Apikeys.phone: phone,
          Apikeys.email: email,
          Apikeys.password: password,
          Apikeys.confirmPassword: confirmPassword,
          Apikeys.location: location,
          Apikeys.brandName: brandName,
          Apikeys.minCharge: minCharge,
          Apikeys.disc: disc,
          Apikeys.healthCertificate: uploadImageToAPI(healthCertificate),
          Apikeys.frontId: uploadImageToAPI(frontId),
          Apikeys.backId: uploadImageToAPI(backId),
          Apikeys.profilePic: uploadImageToAPI(profilePic),
        },
      );
      return Right(SignUpModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
