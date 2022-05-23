


import 'package:crm_smart/model/approvemodel.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/ui/screen/client/addClient.dart';
import 'package:crm_smart/ui/screen/client/editClient.dart';
import 'package:crm_smart/ui/screen/client/transfer_client.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:crm_smart/view_model/approve_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../function_global.dart';

class ClientView extends StatefulWidget {
  ClientView( {this.itemapprove,  required this.idclient, Key? key}) : super(key: key);
  String idclient;
  ApproveModel? itemapprove;
  @override
  _ClientViewState createState() => _ClientViewState();
}

class _ClientViewState extends State<ClientView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late ClientModel clientModel;
  @override
  Widget build(BuildContext context) {
    clientModel=Provider.of<client_vm>(context,listen: true).listClient
        .firstWhere((element) => element.idClients==widget.idclient);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        // height: MediaQuery.of(context).size.height*0.73,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 8,right: 8,
              top:2,bottom: 2),
          child:SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                    onTap: ()async{
                      await FlutterPhoneDirectCaller.callNumber(clientModel.mobile.toString());
                    },
                    child: cardRow(  title:'رقم الهاتف',value:clientModel.mobile.toString())),
                cardRow( title:'تاريخ الاضافة',value:clientModel.dateCreate.toString()),
                cardRow(  title: 'المؤسسة',value:clientModel.nameEnterprise.toString(),
                  isExpanded: true,),
                cardRow( title:'اسم العميل',value:clientModel.nameClient.toString(),isExpanded: true,),
                cardRow( title:' المنطقة',value:clientModel.name_regoin.toString()),
                cardRow( title:' المدينة',value:clientModel.city.toString()),
                cardRow( title:'حالة العميل',value:clientModel.typeClient.toString()),
                clientModel.offer_price!=null&&clientModel.offer_price.toString().trim().isNotEmpty?
                cardRow( title:'مبلغ عرض السعر',value:clientModel.offer_price.toString()):Container(),
                clientModel.offer_price!=null&&clientModel.offer_price.toString().trim().isNotEmpty?
                cardRow( title:'تاريخ عرض السعر',value:clientModel.date_price.toString()):Container(),

                cardRow( title:'الموظف',value:getnameshort(clientModel.nameUser.toString())),
                cardRow( title:'رقم الموظف',value:clientModel.mobileuser.toString()),
                clientModel.nameusertransfer!=null?
                cardRow( title:'قام بتحويل العميل',value:getnameshort(clientModel.nameusertransfer.toString())):Container(),
                clientModel.nameusertransfer!=null?
                cardRow( title:'تاريخ التحويل',value:clientModel.dateTransfer.toString()):Container(),

                Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              kMainColor)),
                      onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => editclient(
                                  itemClient: clientModel,
                                  fkclient: clientModel.idClients.toString(),
                                  fkuser: clientModel.fkUser.toString())
                          ));
                     },  child:Text ('تعديل بيانات العميل'),),
                    clientModel.typeClient=="عرض سعر"
                        ||  clientModel.typeClient=="تفاوض"?
                        SizedBox(width:5 ,):Container(),
                    clientModel.typeClient=="عرض سعر" ||  clientModel.typeClient=="تفاوض"?
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              kMainColor)),
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(
                            builder: (context)=>transferClient(
                              name_enterprise:  clientModel.nameEnterprise.toString(),
                              idclient:   clientModel.idClients.toString(),
                              type: "client",),fullscreenDialog: true

                        ));
                      },
                      child: Text('تحويل العميل'),
                     ):Container(),
                    SizedBox(height: 3,),

                ],
            ),
              ),
                widget.itemapprove!=null?
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(kMainColor)),
                          onPressed: () async{

                            await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(''),
                                  content: Text('تأكيد العملية'),
                                  actions: <Widget>[
                                    new ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(
                                              kMainColor)),
                                      onPressed: () {
                                        Navigator.of(context,
                                            rootNavigator: true)
                                            .pop(
                                            false); // dismisses only the dialog and returns false
                                      },
                                      child: Text('لا'),
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(
                                              kMainColor)),
                                      onPressed: () async {
                                        // Navigator.of(context,
                                        //     rootNavigator: true)
                                        //     .pop(true);
                                        // update client to approved client
                                        Provider.of<client_vm>(context, listen: false)
                                            .setApproveclient_vm({
                                          'idApproveClient':widget.itemapprove!.idApproveClient,
                                          "fk_user":widget.itemapprove!.fkUser,//صاحب العميل
                                          "fk_regoin":widget.itemapprove!.fk_regoin,
                                          "regoin":widget.itemapprove!.nameRegoin,
                                          "fk_country":widget.itemapprove!.fk_country,
                                          "isApprove": "1",
                                          "name_enterprise":widget.itemapprove!.name_enterprise,
                                          "fkusername":widget.itemapprove!.nameUser, //موظف المبيعات
                                          //"message":"",//
                                          "nameuserApproved":
                                          Provider.of<user_vm_provider>(context,listen: false)
                                              .currentUser!.nameUser,
                                          "iduser_approve":  Provider.of<user_vm_provider>(context,listen: false)
                                              .currentUser!.idUser//معتمد الاشتراك
                                        }, widget.itemapprove!.fkClient).then((value) => value!=false?
                                        clear()
                                            : error()// clear()
                                          // _scaffoldKey.currentState!.showSnackBar(
                                          //     SnackBar(content: Text('هناك مشكلة ما')))
                                        );
                                        //Navigator.of(context,rootNavigator: true).pop();
                                        // Navigator.pop(context);
                                        // Navigator.pushAndRemoveUntil(context,
                                        //     MaterialPageRoute(builder: (context)=>Home()),
                                        //         (route) => true
                                        // );//this is active
                                        //  Navigator.pushReplacement(context,
                                        //      MaterialPageRoute(builder:
                                        //          (context)=>ApprovePage()));
                                      },
                                      child: Text('نعم'),
                                    ),
                                  ],
                                );
                              },
                            );

                            //Navigator.pop(context);
                          },
                          child: Text('Approve')),
                      SizedBox(
                        width: 4,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.redAccent)),
                          onPressed: ()  async{
                            Provider.of<client_vm>(context, listen: false)
                                .setApproveclient_vm({
                              'idApproveClient':widget.itemapprove!.idApproveClient,
                              "fk_user":widget.itemapprove!.fkUser,
                              "fk_regoin":widget.itemapprove!.fk_regoin,
                              "regoin":widget.itemapprove!.nameRegoin,
                              "fk_country":widget.itemapprove!.fk_country,
                              "isApprove": "0",
                              "name_enterprise":widget.itemapprove!.name_enterprise,
                              "fkusername":widget.itemapprove!.nameUser, //موظف المبيعات
                              //"message":"",//
                              "nameuserApproved":Provider.of<user_vm_provider>(context,listen: false)
                                  .currentUser!.nameUser,
                              "iduser_approve": Provider.of<user_vm_provider>(context,listen: false)
                                  .currentUser!.idUser//معتمد الاشتراك
                            }, widget.itemapprove!.fkClient)
                                .then((value) =>
                            value!=false?
                            clear()
                                : error()// clear()
                              // _scaffoldKey.currentState!.showSnackBar(
                              //     SnackBar(content: Text('هناك مشكلة ما'))
                              // )
                            );
                            // Navigator.pushAndRemoveUntil(context,
                            //     MaterialPageRoute(builder: (context)=>Home()),
                            //         (route) => true
                            // );
                            // bool result = await showDialog(
                            //   context: context,
                            //   builder: (context) {
                            //     return AlertDialog(
                            //       title: Text(''),
                            //       content: Text('تأكيد العملية  '),
                            //       actions: <Widget>[
                            //         new ElevatedButton(
                            //           style: ButtonStyle(
                            //               backgroundColor: MaterialStateProperty.all(
                            //                   kMainColor)),
                            //           onPressed: () {
                            //             Navigator.of(context,
                            //                 rootNavigator: true)
                            //                 .pop(
                            //                 false); // dismisses only the dialog and returns false
                            //           },
                            //           child: Text('لا'),
                            //         ),
                            //         ElevatedButton(
                            //           style: ButtonStyle(
                            //               backgroundColor: MaterialStateProperty.all(
                            //                   kMainColor)),
                            //           onPressed: () async {
                            //
                            //             // Navigator.of(context,
                            //             //     rootNavigator: true)
                            //             //     .pop(true);
                            //             Navigator.of(context,rootNavigator: true).pop();
                            //
                            //             // Navigator.pushReplacement(context,
                            //             //     MaterialPageRoute(builder:
                            //             //         (context)=>ApprovePage()));
                            //
                            //             Navigator.pushAndRemoveUntil(context,
                            //                 MaterialPageRoute(builder: (context)=>Home()),
                            //                     (route) => false
                            //             );
                            //           },
                            //           child: Text('نعم'),
                            //         ),
                            //       ],
                            //     );
                            //   },
                            // );
                            //send notification
                            //Navigator.pop(context);
                          },
                          child: Text('Refuse')),

                    ],
                  ),
                ):Container(),
        ]),
          ),
      ),
    ));
  }

  clear() {
    Provider.of<approve_vm>(context,listen: false)
        .removeApproveClient(widget.itemapprove!.idApproveClient);
    setState(() {
      widget.itemapprove=null;
    });
  }

  error() {

  }

}
