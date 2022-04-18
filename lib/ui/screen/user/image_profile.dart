import 'dart:io';


import 'package:crm_smart/constants.dart';

import 'package:crm_smart/view_model/user_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageProfile extends StatelessWidget {
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  ImageProfile({Key? key}) : super(key: key);

  // final controllerUser = Get.find<UserVMController>();
  //final controllerUser = Provider.of<user_vm_provider>(context,listen: false);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
        //  Obx( () =>
        CircleAvatar(
                radius: 80.0,
                backgroundImage:
                //controllerUser.isProbicpicpathSet.value == true
                //     ? FileImage(File(controllerUser.profilepicpath.value))
                // as ImageProvider
                //     :
                AssetImage('assest/images/logo.png')),
          //),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.blue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                  context: context,
                  builder: ((context) => bottomSheet(context)),
                );
              },
              child: Icon(
                Icons.camera,
                color: kMainColor,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TextUtilis(
          //   color: Colors.black,
          //   fontSize: 40,
          //   fontWeight: FontWeight.normal,
          //   textstring: 'chose profile photo',
          //   underline: TextDecoration.none,
          // ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              'Chose Profile Photo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  //controllerUser.takedPhoto(ImageSource.camera);
                  // controllerUser.openCamera();
                  // print('camera');
                  takePhoto(ImageSource.camera);
                },
                icon: Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
                label: Text(
                  'Camera',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              TextButton.icon(
                onPressed: () {
                  //controllerUser.openGallery();
                  // print('Gallery');
                  takePhoto(ImageSource.gallery);
                },
                icon: Icon(
                  Icons.open_in_browser,
                  color: Colors.white,
                  //Icons.browse_gallery,
                ),
                label: Text(
                  'Gallery',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedImage =
    await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    // controllerUser.setProfileImagePath(pickedFile!.path);
    // Get.back();
    print(pickedFile);
  }
}