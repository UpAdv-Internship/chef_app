
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:up_dev_chef_app/core/Widgets/custom_text_field.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';
import 'package:up_dev_chef_app/core/utils/app_strings.dart';

class SignUpStep3 extends StatefulWidget {
  const SignUpStep3({
    super.key,
  });

  @override
  State<SignUpStep3> createState() => _SignUpStep3State();
}

class _SignUpStep3State extends State<SignUpStep3> {

  Position? _currentPosition;
  String? _currentAddress;
  bool isLoading = false;

  Future<Position> _getPosition()async{
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();

      if(permission == LocationPermission.deniedForever){
        return Future.error('Location not available !');
      }
    }else{
      print('Location not available !');
    }

    return await Geolocator.getCurrentPosition();

  }

  void _getAdress(latitude, longitude)async{

    try{
      List<Placemark> placemark = await GeocodingPlatform.instance.
      placemarkFromCoordinates(latitude, longitude);

      Placemark place = placemark[0];

      setState(() {
        _currentAddress = '${place.country},${place.locality},${place.street},';
      });
    }catch(e){
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 20.h),
        //! Enter Address
        Text(
          AppStrings.enterYourLocation,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 25,
              ),
        ),
        SizedBox(height: 10.h),
        CustomTextFormField(
          hint:
              '${AppStrings.governorate}.${AppStrings.city}.${AppStrings.location}',
          controller: TextEditingController(),
        ),
        SizedBox(height: 10.h),
        //! Auto Location
        isLoading ? CircularProgressIndicator()
            :Row(
          children: [
            IconButton(
              onPressed: ()async {

                setState(() {
                  isLoading = true;
                });
                _currentPosition = await _getPosition();

                _getAdress(_currentPosition!.latitude, _currentPosition!.longitude);
                setState(() {
                  isLoading = false;
                });
              },
              icon: const Icon(
                Icons.map,
                color: AppColors.primary,
              ),
            ),
            const Spacer(),
            //const Text(AppStrings.address),
            if(_currentAddress != null)
            Container(
                width: 300,
                child: Text(_currentAddress!,
                style: TextStyle(fontSize: 20),) ),
          ],
        ),
        SizedBox(height: 10.h),
        //! Requests Requirements
        Text(
          AppStrings.requestsConditions,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 25,
              ),
        ),
        SizedBox(height: 10.h),
        CustomTextFormField(
          hint: AppStrings.minRequestsNum,
          controller: TextEditingController(),
        ),
      ],
    );
  }
}

