import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:up_dev_chef_app/features/profile/data/models/get_data_profile_model.dart';
import 'package:up_dev_chef_app/features/profile/data/repository/profile_repository.dart';
import 'package:up_dev_chef_app/features/profile/presentation/cubits/profile_cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo, this.getProfileRepo) : super(ProfileInitial());

  final ProfileRepo profileRepo;

  

  //! Update Profile
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController minChargeController = TextEditingController();
  TextEditingController discController = TextEditingController();
  GlobalKey<FormState> updateProfileKey = GlobalKey();
  XFile? image;
  void updateProfile() async {
    emit(UpdateProfileLoadingState());
        print(image!.name);

    final res = await profileRepo.updateProfile(
      name: nameController.text,
      phone: phoneController.text,
      location:locationController.text,

      brandName: brandNameController.text,
      minCharge: minChargeController.text,
      disc: discController.text,
      profilePic: image!,
    );
    res.fold(
      (l) => emit(UpdateProfileErrorState(l)),
      (r) => emit(UpdateProfileSuccessState(r)),
    );
  }
  //! take photo
  void takePhoto(value) {
    image = value;
    
    print(image!.name);
    emit(TakePhotoSuccessState());
  }
  // get chef data 
  final ProfileRepo getProfileRepo;

  GetDataChefModel? getChefModel;
  void getChefData() async {
    emit(GetChefDataLoadingState());
    final result = await getProfileRepo.getChefData();
    result.fold((l) => emit(GetChefDataErrorState()),
        (r) {
          getChefModel=r;
          emit(GetChefDataSuccessState());
        });
  }

  //! Logout
  void logout() async {
    emit(LogoutLoadingState());
    final res = await profileRepo.logout();
    res.fold(
      (l) => emit(LogoutErrorState(l)),
      (r) => emit(LogoutSuccessState(r)),
    );
  }
}
