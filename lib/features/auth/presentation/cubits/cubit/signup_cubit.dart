import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_dev_chef_app/features/auth/presentation/cubits/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  int currentStep = 0;
  increaseStepperIndex() {
    currentStep++;
    emit(IncreaseStepperIndexState());
  }

  decreaseStepperIndex() {
    currentStep--;
    emit(IncreaseStepperIndexState());
  }
}
