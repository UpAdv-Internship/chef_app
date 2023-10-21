import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:up_dev_chef_app/core/common/commons.dart';
import 'package:up_dev_chef_app/core/databases/api/api_consumer.dart';
import 'package:up_dev_chef_app/core/databases/api/end_points.dart';
import 'package:up_dev_chef_app/core/databases/cache/cache_helper.dart';
import 'package:up_dev_chef_app/core/error/exception.dart';
import 'package:up_dev_chef_app/core/services/service_locator.dart';
import 'package:up_dev_chef_app/features/profile/data/models/get_data_profile_model.dart';

class ProfileRepo {
  //! Update Profile
  Future<Either<String, String>> updateProfile({
    required String name,
    required String phone,
    required var location,
    required String brandName,
    required String minCharge,
    required String disc,
    required XFile profilePic,
  }) async {
    try {

      final res = await sl<ApiConsumer>().patch(
        EndPoint.updateChef,
        data: {
          Apikeys.name: name,
          Apikeys.phone: phone,
          Apikeys.location: location,
          Apikeys.brandName: brandName,
          Apikeys.minCharge: minCharge,
          Apikeys.disc: disc,
          Apikeys.profilePic: await uploadImageToAPI(profilePic),
        },
        isFormData: true,
      );
      return Right(res[Apikeys.message]);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  //! Change Password
  //! get chef data
  Future<Either<String, GetDataChefModel>> getChefData() async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoint.getChefDataEndPoints(
            sl<CacheHelper>().getData(key: Apikeys.id)),
      );
      return Right(GetDataChefModel.fromJson(response[Apikeys.chef]));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

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
