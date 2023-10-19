import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:up_dev_chef_app/core/databases/api/api_consumer.dart';
import 'package:up_dev_chef_app/core/databases/api/end_points.dart';
import 'package:up_dev_chef_app/core/error/exception.dart';
import 'package:up_dev_chef_app/core/services/service_locator.dart';

class ProfileRepo {
  //! Update Profile
  Future<Either<String, String>> updateProfile({
    required String name,
    required String phone,
    required String location,
    required String brandName,
    required String minCharge,
    required String disc,
    required XFile profilePic,
  }) async {
    try {
      final res = await sl<ApiConsumer>().patch(
        EndPoint.updateChef,
        data: {
          'name': name,
          'phone': phone,
          'location':
              '{"name":"Egypt","address":"meet halfa","coordinates":[1214451511,12541845]}',
          'brandName': brandName,
          'minCharge': minCharge,
          'disc': disc,
          'profilePic': profilePic,
        },
        isFormData: true,
      );
      return Right(res.data[Apikeys.message]);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
  //! Change Password

  //! Logout
  Future<Either<String, String>> logout() async {
    try {
      final res = await sl<ApiConsumer>().get(EndPoint.logout);
      return Right(res.data![Apikeys.message]);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
