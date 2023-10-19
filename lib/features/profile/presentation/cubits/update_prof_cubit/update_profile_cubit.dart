

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:up_dev_chef_app/features/profile/data/repository/update_repo.dart';
import 'package:up_dev_chef_app/features/profile/presentation/cubits/update_prof_cubit/update_profile_state.dart';


class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this.updateRepo,) : super(UpdateProfileInitial());
  GlobalKey<FormState> updateProfileKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController minimumChargeController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  final UpdateProfileRepository updateRepo;
   XFile? image;


  void updateChef() async {
    emit(UpdateChefLoadingState());
    final result = await updateRepo.updateProfile(
      name: nameController.text,
      phone: phoneController.text,
      brandName: brandNameController.text,
      minCharge: minimumChargeController.text,
      disc: descController.text,
      location:locationController.text ,
      profilePic: image!
      
    );
    result.fold((l) => emit(UpdateChefErroringState()), (r) {
      emit(UpdateChefSuccessState());
    });
  }
  void changeImageUpdateProfile(value) {
    image = value;
    emit(ChangeImageUpdateProfile());
  }

}
