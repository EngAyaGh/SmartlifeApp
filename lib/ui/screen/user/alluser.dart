



import 'package:crm_smart/ui/widgets/card_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'adduser.dart';

class AllUserScreen extends StatelessWidget {
  const AllUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
      backgroundColor: kMainColor,
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>addUser()));

      },
      tooltip: 'إضافة موظف',

      child: Icon(Icons.add),
    ),
      appBar: AppBar(
        title: Text('الموظفين',style: TextStyle(color: kWhiteColor),),

        //centerTitle: true,
      ),
      body: Column(

        children: [
          const SizedBox(
            height: 20,
          ),
          CardUsers(),
        ],
      ),
    );
  }
}