class SignupState {}

final class SignupInitial extends SignupState {}

final class IncreaseStepperIndexState extends SignupState {}

final class SignUpLoadinStateState extends SignupState {}

final class SignUpSuccessState extends SignupState {}

final class SignUpFailureState extends SignupState {
  final String errMessage;
  SignUpFailureState({required this.errMessage});
}

final class ChangeImageState extends SignupState {}

final class ChangeIconButton extends SignupState {}
