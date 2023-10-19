class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class UpdateProfileSuccessState extends ProfileState {
  final String message;
  UpdateProfileSuccessState(this.message);
}

final class UpdateProfileErrorState extends ProfileState {
  final String message;
  UpdateProfileErrorState(this.message);
}

final class UpdateProfileLoadingState extends ProfileState {}

final class LogoutSuccessState extends ProfileState {
  final String message;
  LogoutSuccessState(this.message);
}

final class LogoutErrorState extends ProfileState {
  final String message;
  LogoutErrorState(this.message);
}

final class LogoutLoadingState extends ProfileState {}



