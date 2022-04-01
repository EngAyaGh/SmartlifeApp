import 'dart:html';

import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/ui/widgets/cardClient.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
// import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
class tabclients extends StatefulWidget {
   tabclients({Key? key}) : super(key: key);

  @override
  _tabclientsState createState() => _tabclientsState();
}

class _tabclientsState extends State<tabclients> {
  // final controllerUsers = Get.find<AllUserVMController>();
   List<ClientModel> _list=[];
   String? iduser;
   bool _isLoading=true;
   @override
   void initState()  {

      // WidgetsBinding.instance?.addPostFrameCallback((_) {
      // Provider.of<user_vm_provider>(context,listen: false).getclient_vm();
       Provider.of<user_vm_provider>(context,listen: false).getcurrentuser();
      // WidgetsBinding.instance?.addPostFrameCallback((_) {
       UserModel? us = Provider
             .of<user_vm_provider>(context, listen: false).currentUser;
         iduser = us!.idUser.toString();

         print("init tabview " + iduser.toString());

      // iduser!=null?
       Provider.of<client_vm>(context, listen: false)
             .getclientByIdUser_vm(iduser.toString());
       //:_isLoading=true;
      // });
       super.initState();

   // });
    // print( controllerUsers.currentUser.value.idUser);
   }

  @override
  Widget build(BuildContext context) {

      _list=Provider.of<client_vm>(context,listen: true)
          .listClientbyCurrentUser;

    //});
//
// controllerUsers.getcurrentUser();
// Provider.of<client_vm>(context,listen: false)
//     .getclientByIdUser_vm(
//     controllerUsers.currentUser.value.idUser.toString()
// );
// _list=(context).read<client_vm>().listClientbyCurrentUser;
// _isLoading =_list.isEmpty?true:false;
//
    //_list=(context).read<client_vm>().listClientbyCurrentUser;
    _isLoading =_list.isEmpty||_list==null ?true:false;
  // setState(() {
  //
  // });

    print('build tabview');
    return Scaffold(
      body:_isLoading?
        Center(child: CircularProgressIndicator(),)
        :(_list.isEmpty
    ? Center(child: Text('لا يوجد عملاء',style: TextStyle(fontSize: 22,color: kWhiteColor),),)
        :Padding(
    padding: const EdgeInsets.only(left:20,right: 20,top: 10,bottom: 10),
    child:
      Container(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: cardClient(itemClient: _list[index], iduser: iduser.toString()),
                  ));
            }),
      ),
    )));
  }
}
