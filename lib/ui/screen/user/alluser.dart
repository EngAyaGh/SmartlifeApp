



import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/widgets/user_widget/card_user.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          search_widget("اسم الموظف....",
            Provider.of<user_vm_provider>(context, listen: true).userall,),
          const SizedBox(
            height: 5,
          ),
          CardUsers(),
        ],
      ),
    );
  }
}