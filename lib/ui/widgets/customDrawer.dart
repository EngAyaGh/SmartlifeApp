import 'package:crm_smart/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('aya Ghoury'),
              accountEmail: Text('Aya@ghgh.com')),
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
          ),
          ListTile(
            title: Text('المنتجات'),
            leading: Icon(Icons.add_box_outlined),
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
