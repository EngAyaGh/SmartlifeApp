import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class UserVMController extends GetxController {
  // PickedFile? imageFile;
  final ImagePicker _picker = ImagePicker();

  File? imageFile;

  void onPressPhone(String phone) async {
    await FlutterPhoneDirectCaller.callNumber(phone);
  }

  void onPressEmail() {}

  void takedPhoto(ImageSource source) async {
    // final pickedFile = (await _picker.getImage(
    //   source: source,
    // ))!;
    // imageFile = pickedFile;
    // update();
  }

  openCamera() async {
    var picture = (await ImagePicker().pickImage(source: ImageSource.camera));
    imageFile = picture as File?;
    update();
  }

  openGallery() async {
    var picGalery =
        (await ImagePicker().pickImage(source: ImageSource.gallery));
    imageFile = picGalery as File?;

    update();
  }

  saveImage() {
    // var saveimg = FileImage(File(imageFile!.path));
    // update();
    // return saveimg;
    return Image.file(
      imageFile!,
      width: 100,
      height: 100,
    );
  }
}
