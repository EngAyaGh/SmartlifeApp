

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';
import '../custom_widget/text_uitil.dart';
import 'carduserbuild.dart';

class CardUsers extends StatefulWidget {
  CardUsers({Key? key}) : super(key: key);

  @override
  _CardUsersState createState() => _CardUsersState();
}

class _CardUsersState extends State<CardUsers> {
  //final controllerUsers = Get.find<AllUserVMController>();
  @override void initState() {
    Provider.of<user_vm_provider>
      (context,listen: false).getuser_vm();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final controllerUsers=Provider.of<user_vm_provider>
      (context,listen: true);

    //return Obx( () {
        if (controllerUsers.userall.length==0) {
          return Consumer<user_vm_provider>(
            builder:  (context, cart, child){
              return  const Center(
                child: Text('لا يوجد مستخدمين'),
                // CircularProgressIndicator(
                //   color: kMainColor,
                // ),
              );
            }

          );
        } else {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Expanded(
              child: GridView.builder(
                itemCount: controllerUsers.userall.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.9,
                  mainAxisExtent: 250,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  maxCrossAxisExtent: 250,
                ),
                itemBuilder: (context, index) {
                  return Consumer<user_vm_provider>(
                    builder: (context, cart, child) {
                      return buildCardUsers(
                      usermodell:     controllerUsers.userall[index],
                          // email: controllerUsers.userall![index].email.toString(),
                          // name: controllerUsers.userall![index].nameUser.toString(),
                          // typeAdministration: controllerUsers
                          //     .userall![index].typeAdministration
                          //     .toString(),
                          // image:
                          // 'image   ...controllerUsers.usersList[index].toString()',
                          // onTap: () {
                          //   Navigator.push(context,
                          //       MaterialPageRoute(
                          //           builder:
                          //               (context)=>
                          //               UserScreen(
                          //              userModel: controllerUsers
                          //                       .userall![index]
                          //                 //index: index,
                          //               )));
                          //
                          // }
                          );
                    }

                  );
                },
              ),
            ),
          );
        }
    //   },
    // );
  }


}