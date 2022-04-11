
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardClient.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
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
   UserModel? user;
   bool _isLoading=false;
   @override
   void initState()  {

     super.initState();

      // WidgetsBinding.instance?.addPostFrameCallback((_) {
 //  try{   // Provider.of<user_vm_provider>(context,listen: false).getclient_vm();
 //       Provider.of<user_vm_provider>(context,listen: false)
 //           .getcurrentuser();
      // WidgetsBinding.instance?.addPostFrameCallback((_) {

    //  user  = Provider
    //          .of<user_vm_provider>(context, listen: false)
    //      .currentUser;
    //    Future.microtask(() =>{
    //    context.read<user_vm_provider>().getcurrentuser(),
    //
    //     user=     Provider.of<user_vm_provider>(context, listen: false).currentUser,
    //        Provider.of<client_vm>(context, listen: false)
    //        .getclientByIdUser_vm(
    //            user!.idUser.toString())
    //    } );

     // user=context.read<user_vm_provider>().currentUser;
     //     print('user $user');//null value
     //     iduser = user!.idUser!;

        // print("init tabview " + iduser.toString());

      // iduser!=null?


       // Provider.of<invoice_vm>(context, listen: false)
       //     .get_invoicesbyRegoin(user!.fkRegoin);
       //
       // //:_isLoading=true;
      // });
      //  Provider.of<LoadProvider>(context, listen: false)
      //      .changeboolViewClient(false);
   // }
   // catch(e){print(e);
   // }
   // Provider.of<LoadProvider>(context, listen: false)
   //     .changeboolViewClient(true);
   //_isLoading =false;


   // });
    // print( controllerUsers.currentUser.value.idUser);
    //  Provider.of<client_vm>(context, listen: false)
    //        .getclientByIdUser_vm();
   }
   @override
   void didChangeDependencies() {
     // setState(() {
     //  // isLoading = true;
     // });
     Future.delayed(Duration(milliseconds: 30)).then((_) async {
       await    Provider.of<client_vm>(context, listen: false)
           .getclientByIdUser_vm();
       // user=context.read<user_vm_provider>().currentUser;
       // await    Provider.of<client_vm>(context, listen: false)
       //     .getclientByIdUser_vm(user!.idUser);

      }
     );
     super.didChangeDependencies();
   }
  @override
  Widget build(BuildContext context) {

      // _list=Provider.of<client_vm>(context,listen: true)
      //     .listClientbyCurrentUser;

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
      body:RefreshIndicator(
          onRefresh: ()async{
            // Provider.of<invoice_vm>(context, listen: false)
            //     .get_invoicesbyRegoin(us.fkRegoin);
            // await context.read<invoice_vm>()
            //     .get_invoicesbyRegoin();

            await Provider.of<client_vm>(context, listen: false)
                .getclientByIdUser_vm();

            // context.read<client_vm>()
          },
    //   _isLoading?
    //     Center(child: CircularProgressIndicator(),)
    //     :(_list.isEmpty
    // ? Center(child: Text('لا يوجد عملاء',style: TextStyle(fontSize: 22,color: kWhiteColor),),)
    //     :
    //   ModalProgressHUD(
    //       inAsyncCall:Provider.of<LoadProvider>(context)
    //           .isLoadingViewClient,
    //     opacity: 0.01,
    // child:
     child: Directionality(
       textDirection: TextDirection.rtl,
       child: Padding(
    padding: const EdgeInsets.only(left:20,right: 20,top: 10,bottom: 10),
    child: Center(
            child:
    Consumer<client_vm> (
    builder: (context,value,child) {
    return value.listClientbyCurrentUser.length==0?
    CircularProgressIndicator()
          :ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: value.listClientbyCurrentUser.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: cardClient(
                            itemClient:
                        value.listClientbyCurrentUser[index],
                            iduser: iduser.toString()),
                      ));
                });
         } ),
    )  ),
     )
       ));
  }
}
