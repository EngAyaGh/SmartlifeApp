import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardClient.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import 'addClient.dart';

class tabclients extends StatefulWidget {
  tabclients({Key? key}) : super(key: key);

  @override
  _tabclientsState createState() => _tabclientsState();
}

class _tabclientsState extends State<tabclients> {
  // final controllerUsers = Get.find<AllUserVMController>();
  List<ClientModel> _list = [];
  String? iduser;
  UserModel? user;
  bool _isLoading = false;
  @override
  void initState() {
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
    // List<ClientModel> list= Provider.of<client_vm>(context, listen: false)
    // .listClientbyRegoin;
    // Future.delayed(Duration(milliseconds: 3)).then((_) async {
    //   await    Provider.of<client_vm>(context, listen: false)
    //       .getclientByIdUser_vm(list);
    //   // user=context.read<user_vm_provider>().currentUser;
    //   // await    Provider.of<client_vm>(context, listen: false)
    //   //     .getclientByIdUser_vm(user!.idUser);
    //
    //  }
    // );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // var  value=Provider.of<client_vm>(context,listen: true);
    //     .listClientbyCurrentUser;

    //});
//

    print('build tabview');
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'كل العملاء ',
            style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kMainColor,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => addClient()));
          },
          tooltip: 'إضافة عميل',
          child: Icon(Icons.add),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView(
                children: [
                  search_widget(
                      Provider.of<client_vm>(context, listen: true).listClient),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.75,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Consumer<client_vm>(builder: (context, value, child) {
                        return Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: value.listClient.length,
                              itemBuilder: (context, index) {
                                return SingleChildScrollView(
                                    child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: cardClient(
                                      itemClient: value.listClient[index],
                                      iduser: iduser.toString()),
                                ));
                              }),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        //    )
        );
  }
}
