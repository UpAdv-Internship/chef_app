import 'package:up_dev_chef_app/core/databases/api/end_points.dart';

class SignUpModel {
  final String message;
  final String token;

  SignUpModel({
    required this.message,
    required this.token,
  });
  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
      message: jsonData[Apikeys.message],
      token: jsonData[Apikeys.token],
    );
  }
}