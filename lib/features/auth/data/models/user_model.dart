import 'package:up_dev_chef_app/core/databases/api/end_points.dart';

class UserModel {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;
  final String location;
  final String brandName;
  final String minCharge;
  final String disc;
  final String healthCertificate;
  final String frontId;
  final String backId;
  final String profilePic;
  UserModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.location,
    required this.brandName,
    required this.minCharge,
    required this.disc,
    required this.healthCertificate,
    required this.frontId,
    required this.backId,
    required this.profilePic,
  });
  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      name: jsonData[Apikeys.name],
      phone: jsonData[Apikeys.phone],
      email: jsonData[Apikeys.email],
      password: jsonData[Apikeys.password],
      confirmPassword: jsonData[Apikeys.confirmPassword],
      location: jsonData[Apikeys.location],
      brandName: jsonData[Apikeys.brandName],
      minCharge: jsonData[Apikeys.minCharge],
      disc: jsonData[Apikeys.disc],
      healthCertificate: jsonData[Apikeys.healthCertificate],
      frontId: jsonData[Apikeys.frontId],
      backId: jsonData[Apikeys.backId],
      profilePic: jsonData[Apikeys.profilePic],
    );
  }
}
