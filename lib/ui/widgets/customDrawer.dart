import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            title: Text('Add Products'),
            leading: Icon(Icons.add_box_outlined),
          ),
          ListTile(
            title: Text('Add Gategory'),
            leading: Icon(Icons.add_box_outlined),
          ),
          ListTile(
            title: Text('logout'),
            leading: Icon(Icons.exit_to_app),
            onTap: ()  {

            },
          )
        ],
      ),
    );
  }
}
