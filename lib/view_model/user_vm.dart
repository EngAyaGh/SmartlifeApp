import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class UserVMController extends GetxController {
  late PickedFile imagefile;
  final ImagePicker _pic = ImagePicker();

  void onPressPhone(String phone) async {
    await FlutterPhoneDirectCaller.callNumber(phone);
  }

  void onPressEmail() {}

  void takedPhoto(ImageSource source) async {
    imagefile = (await _pic.getImage(
      source: source,
    ))!;
  }
}