import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:up_dev_chef_app/features/auth/data/repository/auth_repo.dart';
import 'package:up_dev_chef_app/features/auth/presentation/cubits/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepository) : super(SignupInitial());
  AuthRepository authRepository;
  GlobalKey<FormState> signUpStep1FormKey = GlobalKey();
  GlobalKey<FormState> signUpStep2FormKey = GlobalKey();
  GlobalKey<FormState> signUpStep3FormKey = GlobalKey();
  GlobalKey<FormState> signUpStep4FormKey = GlobalKey();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController brandNameTextEditingController =
      TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();
  TextEditingController locationTextEditingController = TextEditingController();
  TextEditingController minChargeTextEditingController =
      TextEditingController();
  TextEditingController discTextEditingController = TextEditingController();
  String? name;
  String? phone;
  String? email;
  String? password;
  String? confirmPassword;
  Map? location;
  String? brandName;
  String? minCharge;
  String? disc;
  XFile? healthCertificate;
  XFile? frontId;
  XFile? backId;
  XFile? profilePic;

  Position? currentPosition;
  String? currentAddress;
  bool isLoading = false;

  int currentStep = 0;
  increaseStepperIndex() {
    currentStep++;
    emit(IncreaseStepperIndexState());
  }

  decreaseStepperIndex() {
    currentStep--;
    emit(IncreaseStepperIndexState());
  }

  signUp() async {
    emit(SignUpLoadinStateState());
    final result = await authRepository.signUp(
      name: name!,
      phone: phone!,
      email: email!,
      password: password!,
      confirmPassword: confirmPassword!,
      location: jsonEncode(location),
      brandName: brandName!,
      minCharge: minCharge!,
      disc: disc!,
      healthCertificate: healthCertificate!,
      frontId: frontId!,
      backId: backId!,
      profilePic: profilePic!,
    );
    result.fold(
      (l) => emit(SignUpFailureState(errMessage: l)),
      (r) => emit(SignUpSuccessState()),
    );
  }

  void changeImage(value) {
    profilePic = value;
    emit(ChangeImageState());
  }

  Future<Position> getPosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location not available !');
      }
    } else {
      if (kDebugMode) {
        print('Location not available !');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  void getAdress(latitude, longitude) async {
    emit(SignUpLoadinStateState());
    try {
      List<Placemark> placemark = await GeocodingPlatform.instance
          .placemarkFromCoordinates(latitude, longitude);

      Placemark place = placemark[0];

      currentAddress = '${place.country},${place.locality},${place.street},';

      location = {
        "name": place.country,
        "address": place.locality,
        "coordinates": [latitude, longitude]
      };
      emit(SignUpSuccessState());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
