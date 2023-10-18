import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void navigate({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushNamed(
    context,
    route,
    arguments: arg,
  );
}
void navigateReplacment({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushReplacementNamed(
    context,
    route,
    arguments: arg,
  );
}
Future<XFile?> pickImage(ImageSource source)async{
  XFile? image= await ImagePicker().pickImage(source: source);
  if(image!=null){
    return image;
  }
  else{
    return null;
  }
}