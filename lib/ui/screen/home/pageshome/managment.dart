import 'package:crm_smart/ui/screen/user/alluser.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../widgethomeitem.dart';

class managmentpage extends StatelessWidget {
  const managmentpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(
              fontFamily: kfontfamily2),
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child:
        Column(children: [
          buildSelectCategory(onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=>
                    AllUserScreen()));
          }, title: 'إدارة المستخدمين'),
          buildSelectCategory(onTap: () {

          }, title: ''),

        ],),

      ),
    );
  }
}
