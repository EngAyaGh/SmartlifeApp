import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/user/image_profile.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';

import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/user_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import 'edituser.dart';

class UserScreen extends StatefulWidget {
  final UserModel userModel;
  //final int index;
  UserScreen({
    required this.userModel,
    //required this.index,
    Key? key,
  }) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late var controllerUser;
  @override
  void initState() {
    //controllerUser =Provider.of<user_vm_provider>(context,listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //return Obx(() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EditUser(userModel: widget.userModel
                                //index: widget.index,
                                )));
                //
                // Get.to(() => EditUser(
                //   index: index,
                //   //userModel: controllerUsers.usersList[index],
                // ));
              },
              icon: const Icon(
                Icons.edit,
                color: kWhiteColor,
              )),
        ],
        title: TextUtilis(
          color: Colors.white,
          fontSize: 35,
          fontWeight: FontWeight.bold,
          textstring: widget.userModel.nameUser.toString(),
          underline: TextDecoration.none,
        ),
        backgroundColor: kMainColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: ContainerShadows(
          padding: EdgeInsets.only(
              top: 35,
              right: 0,
              left: 0,
              bottom:
                  10), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),

          margin: EdgeInsets.only(left: 25, right: 25, top: 45, bottom: 45),
          width: double.infinity,
          //height: 500,
          child: Center(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: ImageProfile(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: info(context),
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
    );
    // });
  }

  Widget info(context) {
    // var controllerUser =Provider.of<user_vm_provider>(context,listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                  des:
                      //controllerUser.userall![widget.index]
                      widget.userModel.typeAdministration.toString(),
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
                  des:
                      //controllerUser.userall![widget.index]
                      widget.userModel.nameRegoin.toString() == "null"
                          ? ""
                          :
                          //controllerUser.userall![widget.index]
                          widget.userModel.nameRegoin.toString(),
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
                  des:
                      //controllerUser.userall![widget.index]
                      widget.userModel.name_level.toString(),
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
                          //controllerUser.userall![widget.index]
                          widget.userModel.email.toString(),
                      underline: TextDecoration.none,
                    ),
                    IconButton(
                      onPressed: () {
                        // controllerUser.onPressEmail(
                        //     controllerUser.userall!index].email.toString());
                        //
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
                      onPressed: () {},
                      // onPressed: () async {
                      //   controllerUser.onPressPhone(
                      //       controllerUser.userall![index].mobile.toString());
                      // },
                      child: TextUtilis(
                        color: kMainColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        textstring:
                            //controllerUser.userall![widget.index]
                            widget.userModel.mobile.toString(),
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
