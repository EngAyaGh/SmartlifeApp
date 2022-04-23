import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/calendar/Event_editing_page.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:crm_smart/ui/widgets/widget%20calendar/calendar_widget.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:group_button/group_button.dart';

class support_table extends StatefulWidget {
  const support_table({Key? key}) : super(key: key);

  @override
  _support_tableState createState() => _support_tableState();
}
int isSelectedtypeinstall=0;
late final String iduser;
List<InvoiceModel> listfilter=[];
class _support_tableState extends State<support_table> {
  @override
  Future<void> didChangeDependencies() async {
    Future.delayed(Duration(milliseconds: 30)).then((_) async {
      await Provider.of<user_vm_provider>(context,listen: false)
          .getuser_vm();
      print(Provider.of<user_vm_provider>(context,listen: false)
          .userall.length);
      Provider.of<regoin_vm>(context,listen: false).getregoin();
    }
    );

    super.didChangeDependencies();
  }
  @override void initState() {
    listfilter=[];
    listfilter.add(InvoiceModel(
        dateCreate: '8/5/2022',
        name_regoin: 'الرياض',
        name_enterprise: 'مطعم ',
        nameUser: 'آية',
        nameClient: 'الانتظار',

        products: []));
    listfilter.add(InvoiceModel(
        dateCreate: '2/1/2022',
        name_regoin: 'مكة',
        name_enterprise: 'سوبر ماركت ',
        nameUser: 'Mohammad',
        nameClient: 'تم التركيب',

        products: []));
    listfilter.add(InvoiceModel(
        dateCreate: '1/5/2022',
        name_regoin: 'جدة',
        name_enterprise: 'جمعية  ',
        nameUser: 'Mohammad',
       nameClient: 'تم التركيب',
        products: []));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMainColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context)=>
                  EventEditingPage()));
          //Get.to(EventEditingPage());
        },
        tooltip: 'إضافة تقويم',
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(' جدول العملاء ',style: TextStyle(color: kWhiteColor),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
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
    // });
    },
    );},
    )
                        :
                    Consumer<user_vm_provider>(
                      builder: (context, cart, child){
                        return  DropdownSearch<UserModel>(
                          mode: Mode.DIALOG,
                          label: "Name",

                          //onFind: (String filter) => cart.getfilteruser(filter),
                          filterFn: (user, filter) => user!.getfilteruser(filter!),
                          //compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                          // itemAsString: (UserModel u) => u.userAsStringByName(),
                          items: cart.userall,
                          itemAsString:
                              ( u) => u!.userAsString(),
                          // selectedItem: cart.currentUser,
                          onChanged: (data) => iduser=data!.idUser!,//print(data!.nameUser),
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
                    CalendarWidget(),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text('اسم المؤسسة',style: TextStyle(fontWeight: FontWeight.bold),) ,
                    //     Text('موظف المبيعات',style: TextStyle(fontWeight: FontWeight.bold),),
                    //     Text('المنطقة',style: TextStyle(fontWeight: FontWeight.bold),),
                    //     Text( 'تاريخ الاشتراك',style: TextStyle(fontWeight: FontWeight.bold),),
                    //     Text( 'حالة العميل',style: TextStyle(fontWeight: FontWeight.bold),),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    // const MySeparator(),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Container(
                    //   height: MediaQuery.of(context).size.height*0.73,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //         child:Expanded(
                    //             child: ListView.builder(
                    //                 scrollDirection: Axis.vertical,
                    //                 itemCount: listfilter.length,
                    //                 itemBuilder: (context, index) {
                    //                   return SingleChildScrollView(
                    //                       child: Padding(
                    //                         padding: const EdgeInsets.all(2),
                    //                         child: Column(
                    //                           children: [
                    //                            Row(
                    //                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                              children: [
                    //                                Text(listfilter[index]
                    //                                    .name_enterprise.toString(),maxLines: 4,) ,
                    //                                Text(listfilter[index].nameUser.toString()),
                    //                                Text(listfilter[index].name_regoin.toString()),
                    //                                Text( listfilter[index]
                    //                                    .dateCreate.toString()),
                    //                                Text( listfilter[index]
                    //                                    .nameClient.toString()),
                    //                              ],
                    //                            ),
                    //                             Divider(thickness: 1,),
                    //                             SizedBox(height: 6,),
                    //                           ],
                    //                         ),
                    //                       ));
                    //                 }),
                    //           ),
                    //
                    //   ),
                    // ),

                  ],
              ),
            ),
          ),
        ),
      ),


    );
  }
}
