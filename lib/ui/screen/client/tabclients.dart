import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardClient.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
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

    // WidgetsBinding.instance?.addPostFrameCallback((_) {

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
    Future.delayed(Duration(milliseconds: 30)).then((_) async {
      await Provider.of<user_vm_provider>(context,listen: false)
          .getuser_vm();
      print(Provider.of<user_vm_provider>(context,listen: false)
          .userall.length);
      Provider.of<regoin_vm>(context,listen: false).getregoin();
      Provider.of<client_vm>(context, listen: false)
          .getclientByRegoin([]);
    }
    );
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
                  Center(
                    child:
                    GroupButton(
                        controller: GroupButtonController(
                          selectedIndex:isSelectedtypeinstall,

                        ),
                        options: GroupButtonOptions(
                            buttonWidth: 100,

                            borderRadius: BorderRadius.circular(10)),
                        buttons: ['الموظف','المناطق'],
                        onSelected: (index,isselected) {
                          print(index);
                          setState(() {
                            isSelectedtypeinstall=index;

                          });
                        }
                    ),
                  ),
                  SizedBox(height: 5,),
                  isSelectedtypeinstall==1?
                  Consumer<regoin_vm>(
                    builder: (context, cart, child){
                      return DropdownButton(
                        isExpanded: true,
                        //hint: Text("حدد حالة العميل"),
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
                              .getclientfilter_Local(iduser!,"regoin");
                          // });
                        },
                      );},
                  )
                      :
                  Consumer<user_vm_provider>(
                    builder: (context, cart, child){
                      return  DropdownSearch<UserModel>(
                        mode: Mode.DIALOG,
                        label: " Name ",

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
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "choose a user",
                          contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                          border: OutlineInputBorder(),
                        ),
                      );

                    },
                  ),

                  SizedBox(height: 25,),
                  search_widget("المؤسسة....",
                      Provider.of<client_vm>(context, listen: true)
                          .listClient,),
                  SizedBox(
                    height: 5,
                  ),
                  RefreshIndicator(
                    onRefresh: ()async{
                      await    Provider.of<client_vm>(context, listen: false)
                          .getclientByRegoin([]);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.73,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8,right: 8,
                            top:8.0,bottom: 20),
                        child:
                            Consumer<client_vm>(builder: (context, value, child) {
                          return Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: value.listClientfilter.length,
                                itemBuilder: (context, index) {
                                  return SingleChildScrollView(
                                      child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: cardClient(
                                        itemClient: value.listClientfilter[index],
                                        iduser: iduser.toString()),
                                  ));
                                }),
                          );
                        }),
                      ),
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
