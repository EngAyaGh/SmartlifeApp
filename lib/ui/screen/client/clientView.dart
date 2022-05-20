


import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/ui/screen/client/addClient.dart';
import 'package:crm_smart/ui/screen/client/editClient.dart';
import 'package:crm_smart/ui/screen/client/transfer_client.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../function_global.dart';

class ClientView extends StatefulWidget {
  ClientView( {required this.idclient, Key? key}) : super(key: key);
  String idclient;
  @override
  _ClientViewState createState() => _ClientViewState();
}

class _ClientViewState extends State<ClientView> {
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
                    child: cardRow(  title: 'رقم الهاتف',value:clientModel.mobile.toString())),
                cardRow( title:'تاريخ الاضافة',value:clientModel.dateCreate.toString()),
                cardRow(  title: 'المؤسسة',value:clientModel.nameEnterprise.toString()),
                cardRow( title:'اسم العميل',value:clientModel.nameClient.toString()),
                cardRow( title:' المنطقة',value:clientModel.name_regoin.toString()),
                cardRow( title:' المدينة',value:clientModel.city.toString()),
                cardRow( title:' حالة العميل',value:clientModel.typeClient.toString()),
                clientModel.offer_price!=null&&clientModel.offer_price.toString().trim().isNotEmpty?
                cardRow( title:'مبلغ عرض السعر',value:clientModel.offer_price.toString()):Container(),
                clientModel.offer_price!=null&&clientModel.offer_price.toString().trim().isNotEmpty?
                cardRow( title:'تاريخ عرض السعر',value:clientModel.date_price.toString()):Container(),

                cardRow( title:'الموظف',value:getnameshort(clientModel.nameUser.toString())),
                cardRow( title:'رقم الموظف',value:clientModel.mobileuser.toString()),
                clientModel.nameusertransfer!=null?
                cardRow( title:' قام بتحويل العميل',value:getnameshort(clientModel.nameusertransfer.toString())):Container(),
                clientModel.nameusertransfer!=null?
                cardRow( title:' تاريخ التحويل',value:clientModel.dateTransfer.toString()):Container(),

                Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    CustomButton(
                      text: 'تعديل بيانات العميل',
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => editclient(
                                    itemClient: clientModel,
                                    fkclient: clientModel.idClients.toString(),
                                    fkuser: clientModel.fkUser.toString())
                                    ));
                      },
                    ),
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
              )
        ]),
          ),
      ),
    ));
  }

}
