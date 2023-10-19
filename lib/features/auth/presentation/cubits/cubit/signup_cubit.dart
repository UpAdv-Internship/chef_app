import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  String? location;
  String? brandName;
  String? minCharge;
  String? disc;
  XFile? healthCertificate;
  XFile? frontId;
  XFile? backId;
  XFile? profilePic;
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
      location: location!,
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
}
