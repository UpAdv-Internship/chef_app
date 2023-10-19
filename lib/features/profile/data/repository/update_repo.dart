
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:up_dev_chef_app/core/common/commons.dart';
import 'package:up_dev_chef_app/core/databases/api/api_consumer.dart';
import 'package:up_dev_chef_app/core/databases/api/end_points.dart';


import '../../../../core/error/exception.dart';
import '../../../../core/services/service_locator.dart';


class UpdateProfileRepository{
  Future<Either<String, String>> updateProfile({
    required String name,
    required String phone,
    required String brandName,
    required String minCharge,
    required String disc,
    required var location,
    required XFile profilePic,
    
  }) async {
    try {
      final responese = await sl<ApiConsumer>().patch(
        EndPoint.updateChef,
        isFormData:true,
        data: {
          Apikeys.name: name,
          Apikeys.phone: phone,
          Apikeys.brandName: brandName,
          Apikeys.minCharge: minCharge,
          Apikeys.disc: disc,
          Apikeys.location: location,
          Apikeys.profilePic:await uploadImageToAPI(profilePic) ,

        },
      );
      return Right(responese[Apikeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}