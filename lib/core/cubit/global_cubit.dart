



import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:up_dev_chef_app/core/cubit/global_state.dart';
import 'package:up_dev_chef_app/features/profile/data/models/get_data_profile_model.dart';
import 'package:up_dev_chef_app/features/profile/data/repository/profile_repository.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit(this.getProfileRepo) : super(GlobalInitial());
  XFile? profileImage;
  // get chef data 
  final ProfileRepo getProfileRepo;

  GetDataChefModel? getChefModel;
  void getChefData() async {
    emit(GetChefDataLoadingState());
    final result = await getProfileRepo.getChefData();
    result.fold((l) => emit(GetChefDataErrorState()),
        (r) async{
          getChefModel=r;
          profileImage= await downloadAndSaveImage(r.profilePic);
          emit(GetChefDataSuccessState());
        });
  }

  Future<XFile> downloadAndSaveImage(String imageUrl) async {
    final dio = Dio();
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/image.jpg';
    await dio.download(imageUrl, filePath);
    return XFile(filePath);
  }
}
