import 'dart:html';

import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardClient.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
   bool _isLoading=false;
   @override
   void initState()  {

      // WidgetsBinding.instance?.addPostFrameCallback((_) {
 //  try{   // Provider.of<user_vm_provider>(context,listen: false).getclient_vm();
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
      //  Provider.of<LoadProvider>(context, listen: false)
      //      .changeboolViewClient(false);
   // }
   // catch(e){print(e);
   // }
   // Provider.of<LoadProvider>(context, listen: false)
   //     .changeboolViewClient(true);
   //_isLoading =false;

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
     //_list==null ?true:false;
  //  _isLoading =_list!=null?false:true;
    // Provider.of<LoadProvider>(context, listen: true)
    //     .changeboolViewClient(true):
    // Provider.of<LoadProvider>(context, listen:true)
    //     .changeboolViewClient(false);
  // setState(() {
  //
  // });

    print('build tabview');
    return Scaffold(
      body:
      _isLoading?
        Center(child: CircularProgressIndicator(),)
        :(_list.isEmpty
    ? Center(child: Text('لا يوجد عملاء',style: TextStyle(fontSize: 22,color: kWhiteColor),),)
        :
    //   ModalProgressHUD(
    //       inAsyncCall:Provider.of<LoadProvider>(context)
    //           .isLoadingViewClient,
    //     opacity: 0.01,
        //child:
          Padding(
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
           )
       ));
  }
}
