import 'package:crm_smart/constants.dart';
import 'package:crm_smart/routes/routes.dart';
import 'package:crm_smart/ui/screen/product/productView.dart';
import 'package:crm_smart/ui/screen/selectCountryScreen.dart';
import 'package:crm_smart/ui/screen/user/alluser.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);
  //final controllerUsers = Get.find<AllUserVMController>();

  @override
  Widget build(BuildContext context) {
   var controllerUsers= Provider.of<user_vm_provider>(context,listen: true);
   // controllerUsers.getcurrentUser();

     // print(controllerUsers.currentUser.value.nameUser.toString());
     //  return Drawer(
     //
     //    elevation: 10,
     //    child: ListView(
     //      children: [
     //        Stack(
     //          alignment: Alignment.center,
     //          children: [
     //            Positioned(
     //              top: 10,
     //              child: CircleAvatar(
     //                radius: 50,
     //                backgroundColor: Colors.white38,
     //                //,
     //              ),
     //            ),
     //            UserAccountsDrawerHeader(
     //                accountName:
     //                Text(controllerUsers.currentUser!.nameUser.toString(),
     //                  style: TextStyle(
     //                      fontFamily: kfontfamily2),
     //                ),
     //
     //                accountEmail:
     //                Text(controllerUsers.currentUser!.email.toString(),
     //              style: TextStyle(
     //                  fontFamily: kfontfamily2),
     //            ),
     //
     //            ),
     //          ],
     //        ),
     //
     //
     //        ListTile(
     //          title: Text(' الدولة',  style: TextStyle(
     //              fontFamily: kfontfamily2),
     //        ),
     //          leading: Icon(Icons.location_city_rounded),
     //          onTap: (){
     //            Navigator.push(
     //              context,
     //              MaterialPageRoute<void>(
     //                builder: (BuildContext context)
     //                => select_country(),
     //                fullscreenDialog: true,
     //              ),
     //            );
     //          },
     //        ),
     //        // ListTile(
     //        //   title: Text('إدارة المستخدمين'),
     //        //   leading: Icon(Icons.add_box_outlined),
     //        //   onTap: () {
     //        //     Get.to(() => Routes.allUserScreen);
     //        //   },
     //        // ),
     //        ListTile(
     //          title: Text('المنتجات',  style: TextStyle(
     //              fontFamily: kfontfamily2),
     //          ),
     //          leading: Icon(Icons.shop),
     //          onTap: () {
     //            Navigator.push(
     //              context,
     //              MaterialPageRoute<void>(
     //                builder: (BuildContext context)
     //                => ProductView(),
     //                fullscreenDialog: true,
     //              ),
     //            );
     //            // ProductView();
     //          },
     //        ),
     //        ListTile(
     //          title: Text('تسجيل خروج',  style: TextStyle(
     //              fontFamily: kfontfamily2),
     //          ),
     //          leading: Icon(Icons.exit_to_app),
     //          onTap: () async {
     //            SharedPreferences preferences =
     //                await SharedPreferences.getInstance();
     //            preferences.setBool(kKeepMeLoggedIn, false);
     //          },
     //        )
     //      ],
     //    ),
     //  );
return  Drawer(
  child: Container(
    color: Colors.white,
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color:Colors.white24 //Color(0xFF56ccf2),
          ),
               accountName:
                   Text(controllerUsers.currentUser!.nameUser.toString(),
                     style: TextStyle(
                         fontFamily: kfontfamily2),
                   ),

                   accountEmail:
                   Text(controllerUsers.currentUser!.email.toString(),
                 style: TextStyle(
                     fontFamily: kfontfamily2),
               ),
          currentAccountPicture:
          CircleAvatar(
            backgroundColor:
            Theme.of(context).platform == TargetPlatform.iOS
                ? Color(0xFF56ccf2)
                : Colors.grey,
            child: Text("AG",
              style: TextStyle(fontSize: 50,
                color: Colors.amber,),),
          ),
        ),
               ListTile(
                 title: Text(' الدولة',  style: TextStyle(
                     fontFamily: kfontfamily2),
               ),
                 leading: Icon(Icons.location_city_rounded,color: kMainColor,),
                 onTap: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute<void>(
                       builder: (BuildContext context)
                       => select_country(),
                       fullscreenDialog: true,
                     ),
                   );
                 },
               ),
               // ListTile(
               //   title: Text('إدارة المستخدمين'),
               //   leading: Icon(Icons.add_box_outlined),
               //   onTap: () {
               //     Get.to(() => Routes.allUserScreen);
               //   },
               // ),
               ListTile(
                 title: Text('المنتجات',  style: TextStyle(
                     fontFamily: kfontfamily2),
                 ),
                 leading: Icon(Icons.shop,color: kMainColor,),
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute<void>(
                       builder: (BuildContext context)
                       => ProductView(),
                       fullscreenDialog: true,
                     ),
                   );
                   // ProductView();
                 },
               ),
               ListTile(
                 title: Text('تسجيل خروج',  style: TextStyle(
                     fontFamily: kfontfamily2),
                 ),
                 leading: Icon(Icons.exit_to_app,color: kMainColor,),
                 onTap: () async {
                   SharedPreferences preferences =
                       await SharedPreferences.getInstance();
                   preferences.setBool(kKeepMeLoggedIn, false);
                 },
               )
      ],
    ),
  ),
);
  }
}
