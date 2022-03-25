import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/ui/widgets/cardClient.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
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
   final controllerUsers = Get.find<AllUserVMController>();

   List<ClientModel> _list=[];

   bool _isLoading=true;
   @override
   void initState()  {
     Provider.of<client_vm>(context,listen: false)
         .getclientByIdUser_vm(
         controllerUsers.currentUser.value.idUser.toString()
     );
     // WidgetsBinding.instance?.addPostFrameCallback((_) {
     //
     // });
     super.initState();
   }
  @override
  Widget build(BuildContext context) {
    Provider.of<client_vm>(context,listen: false)
        .getclientByIdUser_vm(
        controllerUsers.currentUser.value.idUser.toString()
    );
    //controllerUsers.getcurrentUser();
    print("build sd");
    //print(controllerUsers.currentUser.value.idUser.toString());
  //.then((value) => _isLoading=false);

    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    // });
    _list=(context).read<client_vm>().listClientbyCurrentUser;
    _isLoading =_list.isEmpty?false:false;

    print('build tabview');
    return Scaffold(
      body:_isLoading?
        Center(child: CircularProgressIndicator(),)
        :(_list.isEmpty
    ? Center(child: Text('لا يوجد منتجات',style: TextStyle(fontSize: 22,color: kWhiteColor),),)
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
                    child: cardClient(itemClient: _list[index],),
                  ));
            }),
      ),
    )));
  }
}
