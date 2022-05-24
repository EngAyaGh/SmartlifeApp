

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';
class support_view extends StatefulWidget {
  const support_view({Key? key}) : super(key: key);

  @override
  _support_viewState createState() => _support_viewState();
}

class _support_viewState extends State<support_view> {
  String? regoin;
  String? typeclientvalue;
  late String typepayController;
  @override void didChangeDependencies() async {

    WidgetsBinding.instance!.addPostFrameCallback((_)async{
     // await   Provider.of<invoice_vm>(context, listen: false).getinvoices();
      // Add Your Code here.
      Provider.of<invoice_vm>(context, listen: false)
          .getinvoice_Local("مشترك",'approved');
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('العملاء المشتركين',style: TextStyle(color: kWhiteColor),),
        centerTitle: true,
      ),
      body: Consumer<privilge_vm>(
        builder: (context, privilge, child) {
          return SafeArea(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ListView(
                    children: [
                      privilge.checkprivlge('8') == true ? //regoin
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Consumer<regoin_vm>(
                          builder: (context, cart, child) {
                            return

                              DropdownButton(

                                isExpanded: true,
                                hint: Text("المنطقة"),
                                items: cart.listregoin.map((level_one) {
                                  return DropdownMenuItem(

                                    child: Text(level_one.name_regoin),
                                    //label of item
                                    value: level_one
                                        .id_regoin, //value of item
                                  );
                                }).toList(),
                                value: cart.selectedValueLevel,
                                onChanged: (value) {
                                  //  setState(() {
                                  cart.changeVal(value.toString());
                                  regoin = value.toString();
                                  filtershow();
                                },
                              );
                            //);
                          },
                        ),
                      ) : Container(),
                      Consumer<typeclient>(
                          builder: (context, selectedProvider, child){
                            return  GroupButton(
                                controller: GroupButtonController(
                                  selectedIndex:selectedProvider.selectedinstall,

                                ),
                                options: GroupButtonOptions(
                                    buttonWidth: 110,
                                    borderRadius: BorderRadius.circular(10)),
                                buttons: ['بالإنتظار','تم التركيب'],
                                onSelected: (index,isselected){
                                  print(index);
                                  //setState(() {
                                  typepayController=index.toString();
                                  selectedProvider.changeinstall(index);
                                  //});
                                }
                            );
                          }

                      ),
                      // Expanded(
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(left: 20.0, right: 8),
                      //     child: Consumer<typeclient>(
                      //         builder: (context, cart, child) {
                      //           return DropdownButton(
                      //             isExpanded: true,
                      //             hint: Text('الحالة'),
                      //             //hint: Text("حدد حالة العميل"),
                      //             items: cart.listtype_install.map((level_one) {
                      //               return DropdownMenuItem(
                      //                 child: Text(level_one), //label of item
                      //                 value: level_one, //value of item
                      //               );
                      //             }).toList(),
                      //             value: cart.selectedinstall,
                      //             onChanged: (value) {
                      //               //namemanage=value.toString();
                      //               cart.changeinstall(value.toString());
                      //               typeclientvalue = value.toString();
                      //               filtershow();
                      //             },
                      //           );
                      //         }
                      //     ),
                      //   ),
                      // ),
                      search_widget(
                        'invoice',
                        "المؤسسة....",
                        // Provider
                        //     .of<invoice_vm>(context, listen: true)
                        //     .listInvoicesAccept,
                      ),
                      SizedBox(height: 5,),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.73,

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Consumer<invoice_vm>(
                              builder: (context, value, child) {
                                return value.listInvoicesAccept.length == 0 ?
                                Center(child: Text('لا توجد بيانات'))
                                    : Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: value.listInvoicesAccept
                                              .length,
                                          itemBuilder: (context, index) {
                                            return SingleChildScrollView(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      2),
                                                  child: Column(
                                                    children: [
                                                      ListTile(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (
                                                                      context) =>
                                                                      support_add(
                                                                          idinvoice: value
                                                                              .listInvoicesAccept[index]
                                                                              .idInvoice
                                                                              .toString()
                                                                      )));
                                                        },
                                                        title: Text(value
                                                            .listInvoicesAccept[index]
                                                            .name_enterprise
                                                            .toString(),
                                                          style: TextStyle(
                                                              fontFamily: kfontfamily2
                                                          ),),
                                                        // leading:
                                                        trailing: Text(value
                                                            .listInvoicesAccept[index]
                                                            .date_approve
                                                            .toString(),
                                                          style: TextStyle(
                                                              fontFamily: kfontfamily2
                                                          ),),
                                                      ),
                                                      // const MySeparator(color: Colors.grey),
                                                      Divider(thickness: 2,),
                                                    ],
                                                  ),
                                                ));
                                          }),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                    ],
                  )),
            ),
          );
        }),
    );
  }

    void filtershow(){

    }
}
