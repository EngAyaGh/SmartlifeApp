import 'package:crm_smart/constants.dart';
import 'package:crm_smart/routes/routes.dart';
import 'package:crm_smart/ui/screen/product/productView.dart';
import 'package:crm_smart/ui/screen/user/alluser.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
   CustomDrawer({Key? key}) : super(key: key);
  final controllerUsers = Get.find<AllUserVMController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text(controllerUsers.currentUser.value.nameUser.toString()),
              accountEmail: Text(controllerUsers.currentUser.value.email.toString())),
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                //,
              ),

            ],
          ),
          ListTile(
            title: Text(' الدولة'),
            leading: Icon(Icons.add_box_outlined),
          ),
          ListTile(
            title: Text('إدارة المستخدمين'),
            leading: Icon(Icons.add_box_outlined),
            onTap: (){
              Get.to(() =>Routes.allUserScreen);
            },
          ),
          ListTile(
            title: Text('المنتجات'),
            leading: Icon(Icons.add_box_outlined),
            onTap: (){
              ProductView();
            },
          ),
          ListTile(
            title: Text('تسجيل خروج'),
            leading: Icon(Icons.exit_to_app),
            onTap: () async {
              SharedPreferences preferences =
              await SharedPreferences.getInstance();
              preferences.setBool(kKeepMeLoggedIn, false);
            },
          )
        ],
      ),
    );
  }
}
