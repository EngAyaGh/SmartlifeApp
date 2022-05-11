import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardClient.dart';
import 'package:crm_smart/ui/widgets/client_widget/clientCardNew.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:group_button/group_button.dart';
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
  int isSelectedtypeinstall=0;
  @override
  void initState() {
    super.initState();
    Provider.of<user_vm_provider>(context,listen: false)
        .getuser_vm();
    print(Provider.of<user_vm_provider>(context,listen: false)
        .userall.length);
    Provider.of<regoin_vm>(context,listen: false).getregoin();

    WidgetsBinding.instance!.addPostFrameCallback((_)async{

      // Add Your Code here.

      List<PrivilgeModel> list=
          await   Provider.of<privilge_vm>(context,listen: false).privilgelist;
      Provider.of<client_vm>(context, listen: false).setvaluepriv(list);
      await Provider.of<client_vm>(context, listen: false)
          .getclient_vm();
    });

    // WidgetsBinding.instance?.addPostFrameCallback((_) {
  }

  @override
  void didChangeDependencies() {

    // List<ClientModel> list= Provider.of<client_vm>(context, listen: false)
    // .listClientbyRegoin;
    Future.delayed(Duration(milliseconds: 30)).then((_) async {

     }
    );
    // Future.delayed(Duration(milliseconds: 30)).then((_) async {
    //   await Provider.of<user_vm_provider>(context,listen: false)
    //       .getuser_vm();
    //   print(Provider.of<user_vm_provider>(context,listen: false)
    //       .userall.length);
    //   Provider.of<regoin_vm>(context,listen: false).getregoin();
    //   Provider.of<client_vm>(context, listen: false)
    //       .getclientByRegoin([]);
    // }
    // );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
  //  Provider.of<client_vm>(context, listen: false).getudate();

    print('build tabview');
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   centerTitle: true,
        //   title: Text(
        //     'كل العملاء ',
        //     style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
        //   ),
        // ),
        floatingActionButton: FloatingActionButton(

          backgroundColor: kMainColor,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => addClient()));
          },
          tooltip: 'إضافة عميل',
          child: Icon(Icons.add),
        ),
        body:
        Consumer<privilge_vm>(
            builder: (context, privilge, child){
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        privilge.checkprivlge('8')==true? //regoin
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8),
                            child: Consumer<regoin_vm>(
                              builder: (context, cart, child){
                                return Container(
                                  height: 57,
                                  decoration: BoxDecoration(

                                       border:Border.all(

                                         color: Colors.grey.withOpacity(0.9)
                                         //width: 1,
                                       ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6.0) //                 <--- border radius here
                                ),
                                  ),
                                  child: DropdownButton(

                                    isExpanded: true,
                                    hint: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text("المنطقة"),
                                    ),
                                    items: cart.listregoin.map((level_one) {
                                      return DropdownMenuItem(

                                        child: Text(level_one.name_regoin), //label of item
                                        value: level_one.id_regoin, //value of item
                                      );
                                    }).toList(),
                                    value:cart.selectedValueLevel,
                                    onChanged:(value) {
                                      //  setState(() {
                                      cart.changeVal(value.toString());
                                      Provider.of<client_vm>(context, listen: false)
                                          .getclientfilter_Local(value.toString(),"regoin");
                                      // });
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ):Container(),
                        // (   privilge.checkprivlge('16')==true
                        //     && privilge.checkprivlge('8')!=true
                        //     && privilge.checkprivlge('15')!=true )?
                        privilge.checkprivlge('15')==true|| privilge.checkprivlge('8')==true? //user
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8),
                            child: Consumer<user_vm_provider>(
                              builder: (context, cart, child){
                                return  DropdownSearch<UserModel>(
                                  mode: Mode.DIALOG,
                                  label: " الموظف ",

                                  //onFind: (String filter) => cart.getfilteruser(filter),
                                  filterFn: (user, filter) => user!.getfilteruser(filter!),
                                  //compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                                  // itemAsString: (UserModel u) => u.userAsStringByName(),
                                  items: cart.userall,
                                  itemAsString:
                                      ( u) => u!.userAsString(),

                                  // selectedItem: cart.currentUser,
                                  onChanged: (data) {
                                    iduser=data!.idUser;
                                    Provider.of<client_vm>(context, listen: false)
                                        .getclientfilter_Local(iduser!,"user");
                                  } ,//print(data!.nameUser),
                                  showSearchBox: true,

                                  dropdownSearchDecoration:
                                  InputDecoration(
                                    fillColor:  Colors.grey.withOpacity(0.2),
                                    labelText: "choose a user",
                                    contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(color: Colors.white)),
                                    border:OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(color: Colors.white)),
                                  ),
                                );

                              },
                            ),
                          )
                        ):Container(),
                      ],
                    ),
                    // Center(
                    //   child:
                    //   Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //    // Row(
                    //    //
                    //    //   children: [   Text('فلترة'),
                    //    //     Icon(Icons.filter_alt_sharp),],
                    //    // ),
                    //       GroupButton(
                    //           controller: GroupButtonController(
                    //             selectedIndex:isSelectedtypeinstall,
                    //
                    //           ),
                    //           options: GroupButtonOptions(
                    //               buttonWidth: 100,
                    //
                    //               borderRadius: BorderRadius.circular(10)),
                    //           buttons: ['الموظف','المناطق'],
                    //           onSelected: (index,isselected) {
                    //             print(index);
                    //             setState(() {
                    //               isSelectedtypeinstall=index;
                    //
                    //             });
                    //           }
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    //SizedBox(height: 5,),

                    //isSelectedtypeinstall==1?

                    SizedBox(height: 2,),
                    search_widget("المؤسسة....",
                        Provider.of<client_vm>(context, listen: true)
                            .listClientfilter,),
                    SizedBox(
                      height: 5,
                    ),
                    RefreshIndicator(
                      onRefresh: ()async{
                        await    Provider.of<client_vm>(context, listen: false)
                            .getclient_vm(
                            // Provider.of<privilge_vm>(context,listen: false)
                            //     .privilgelist
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.8,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8,right: 8,
                              top:8.0,bottom: 20),
                          child:
                              Consumer<client_vm>(builder: (context, value, child) {
                                 return value.listClientfilter.length==0?
                                 Text(''):Column(
                                   children: [
                                     Expanded(
                              child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: value.listClientfilter.length,
                                      itemBuilder: (context, index) {

                                        return SingleChildScrollView(
                                            child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child:
                                          //Text(''),
                                          cardClientnew(
                                              itemClient: value.listClientfilter[index],
                                              iduser: iduser.toString()),
                                        ));
                                      }),
                            ),
                                   ],
                                 );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );})

        //    )
        );
  }
}
