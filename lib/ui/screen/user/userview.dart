
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/user/image_profile.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';

import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/user_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import 'edituser.dart';

class UserScreen extends StatelessWidget {
  //final UserModel userModel;
  final int index;
  UserScreen({
    //  required this.userModel,
    required this.index,
    Key? key,
  }) : super(key: key);

  final scrollController = ScrollController(initialScrollOffset: 0);
  final controllerUser = Get.find<UserVMController>();
  final controllerUsers = Get.find<AllUserVMController>();
  // final controller = Get.find<UserViewModel>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => EditUser(
                    index: index,
                    //userModel: controllerUsers.usersList[index],
                  ));
                },
                icon: const Icon(Icons.edit)),
          ],
          title: TextUtilis(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
            textstring: controllerUsers.usersList[index].nameUser.toString(),
            underline: TextDecoration.none,
          ),
          backgroundColor: kMainColor,
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: ContainerShadows(
            margin: EdgeInsets.only(left: 30, right: 30),
            width: double.infinity,
            height: 500,
            child: Center(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Obx(
                      () => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: ImageProfile(),
                      ),
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
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  // Widget imageProfile(context) {
  //   return Center(
  //     child: Stack(
  //       children: [
  //         CircleAvatar(
  //           radius: 80.0,
  //           backgroundImage: //controllerUser.imagefile == null
  //               controllerUser.imageFile == null
  //                   ? AssetImage('assest/images/logo.png')
  //                   : controllerUser.saveImage(),

  //           //const AssetImage(kLogo)
  //           //: const AssetImage(kLogo),
  //         ),
  //         Positioned(
  //           bottom: 20.0,
  //           right: 20.0,
  //           child: InkWell(
  //             onTap: () {
  //               showModalBottomSheet(
  //                 context: context,
  //                 builder: ((builder) => bottomSheet()),
  //               );
  //             },
  //             child: Icon(
  //               Icons.camera,
  //               color: kMainColor,
  //               size: 25,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
          ContainerShadows(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: RowEdit(
                  des: controllerUsers.usersList[index].typeAdministration
                      .toString(),
                  name: 'الإدارات',
                ),
              )),

          SizedBox(
            height: 10,
          ),
          ContainerShadows(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: RowEdit(
                  des: controllerUsers.usersList[index].nameRegoin.toString() ==
                      "null"
                      ? ""
                      : controllerUsers.usersList[index].nameRegoin.toString(),
                  name: 'المنطقة',
                ),
              )),

          SizedBox(
            height: 10,
          ),
          ContainerShadows(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: RowEdit(
                  des: controllerUsers.usersList[index].name_level.toString(),
                  name: 'المستوى',
                ),
              )),

          SizedBox(
            height: 10,
          ),

          // RowWidget(
          //   name: 'Added by',
          //   des: 'added',
          // ),
          ContainerShadows(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtilis(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      textstring:
                      controllerUsers.usersList[index].email.toString(),
                      underline: TextDecoration.none,
                    ),
                    IconButton(
                      onPressed: () {
                        controllerUser.onPressEmail(
                            controllerUsers.usersList[index].email.toString());
                      },
                      icon: const Icon(
                        Icons.email,
                        size: 20,
                        color: kMainColor,
                      ),
                    ),
                  ],
                ),
              )),

          const SizedBox(
            height: 10,
          ),
          ContainerShadows(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtilis(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      textstring: 'الهاتف',
                      underline: TextDecoration.none,
                    ),
                    TextButton(
                      onPressed: () async {
                        controllerUser.onPressPhone(
                            controllerUsers.usersList[index].mobile.toString());
                      },
                      child: TextUtilis(
                        color: kMainColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        textstring:
                        controllerUsers.usersList[index].mobile.toString(),
                        underline: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              )),

          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
