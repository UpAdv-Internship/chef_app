

import 'package:up_dev_chef_app/core/databases/api/end_points.dart';

class GetDataChefModel {
  final String name;
  
  // final String phone;
  
  // final String brandName;
  // final String minCharge;
  // final String disc;
  final String email;
  final String profilePic;
  

  GetDataChefModel({
    required this.email,
    required this.name,
    required this.profilePic,
    
    
    // required this.phone,
    // required this.brandName,
    // required this.minCharge,
    // required this.disc,
  });
  factory GetDataChefModel.fromJson(Map<String, dynamic> json) {
    return GetDataChefModel(
      
      name: json[Apikeys.name],
      profilePic: json[Apikeys.profilePic],
      
      // phone: json['phone'],
      email: json[Apikeys.email],
      // brandName: json['brandName'],
      // minCharge: json['minCharge'],
      // disc: json['disc'],
    );
  }
}
