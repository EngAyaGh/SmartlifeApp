


import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/widgets/row_widget.dart';
import 'package:crm_smart/ui/widgets/text_uitil.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/user_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import 'edituser.dart';

class UserScreen extends StatelessWidget {
  final UserModel userModel;
  UserScreen({
    required this.userModel,
    Key? key,
  }) : super(key: key);

  final scrollController = ScrollController(initialScrollOffset: 0);
  final controllerUser = Get.find<UserVMController>();
  final controllerUsers = Get.find<AllUserVMController>();
  // final controller = Get.find<UserViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => EditUser(
                  userModel: controllerUsers.usersList[0],
                ));
              },
              icon: const Icon(Icons.edit)),
        ],
        title: TextUtilis(
          color: Colors.amberAccent,
          fontSize: 35,
          fontWeight: FontWeight.bold,
          textstring: userModel.nameUser.toString(),
          underline: TextDecoration.none,
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          imageProfile(context),
          Expanded(
            child: info(),
            // child: ListView.separated(
            //   controller: scrollController,
            //   itemCount: 6,
            //   separatorBuilder: (context, index) => const Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            //     child: Divider(
            //       color: Colors.grey,
            //       thickness: 1,
            //     ),
            //   ),
            //   itemBuilder: (context, index) {
            //      return infoUser(name: userModel.nameUser.toString());
            //   },
            // ),
          ),
        ],
      ),
    );
  }

  Widget imageProfile(context) {
    return Container(
      height: 150,
      child: Stack(
        children: [
          Obx(() {
            return CircleAvatar(
              radius: 80.0,
              backgroundImage: controllerUser.imagefile == null
                  ? const AssetImage(kLogo)
                  : const AssetImage(kLogo),
            );
          }),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => onTapCamer()),
                );
              },
              child: Icon(
                Icons.camera,
                color: Colors.green,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget onTapCamer() {
    return Container(
      height: 100.0,
      width: 50,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(children: [
        TextUtilis(
          color: Colors.black45,
          fontSize: 20,
          fontWeight: FontWeight.normal,
          textstring: 'chose profile photo',
          underline: TextDecoration.none,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
              onPressed: () {
                controllerUser.takedPhoto(ImageSource.camera);
              },
              icon: Icon(
                Icons.camera,
              ),
              label: Text('Camera'),
            ),
            FlatButton.icon(
              onPressed: () {
                controllerUser.takedPhoto(ImageSource.gallery);
              },
              icon: Icon(
                Icons.open_in_browser,
                //Icons.browse_gallery,
              ),
              label: Text('Gallery'),
            ),
          ],
        )
      ]),
    );
  }

  // Widget infoUser() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         TextUtilis(
  //           color: Colors.black,
  //           fontSize: 35,
  //           fontWeight: FontWeight.bold,
  //           textstring: name,
  //           underline: TextDecoration.none,
  //         ),
  //         isText
  //             ? TextUtilis(
  //                 color: Colors.black,
  //                 fontSize: 100,
  //                 fontWeight: FontWeight.normal,
  //                 textstring: 'op manager',
  //                 underline: TextDecoration.none,
  //               )
  //             : isIcons
  //                 ? IconButton(onPressed: () {}, icon: const Icon(Icons.email))
  //                 : TextButton(
  //                     onPressed: () {},
  //                     child: TextUtilis(
  //                       color: Colors.black,
  //                       fontSize: 100,
  //                       fontWeight: FontWeight.normal,
  //                       textstring: 'phone number',
  //                       underline: TextDecoration.none,
  //                     ),
  //                   ),
  //       ],
  //     ),
  //   );
  // }

  Widget info() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Column(
        children: [
          RowWidget(
            name: 'Description',
            des: userModel.typeAdministration.toString(),
          ),
          RowWidget(
            name: 'Region',
            des: userModel.nameRegoin.toString(),
          ),
          RowWidget(
            name: 'Level',
            des: userModel.typeLevel.toString(),
          ),
          RowWidget(
            name: 'Added by',
            des: 'added',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextUtilis(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                textstring: userModel.email.toString(),
                underline: TextDecoration.none,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.email,
                  size: 20,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextUtilis(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                textstring: 'Mobile Number',
                underline: TextDecoration.none,
              ),
              TextButton(
                onPressed: () async {
                  controllerUser.onPressPhone(userModel.mobile.toString());
                },
                child: TextUtilis(
                  color: Colors.blueAccent,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  textstring: userModel.mobile.toString(),
                  underline: TextDecoration.none,
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
