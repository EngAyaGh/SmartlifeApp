


import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/ui/screen/client/addClient.dart';
import 'package:crm_smart/ui/screen/client/editClient.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          child:Column(
            children: [
              cardRow(  title: 'اسم المؤسسة',value:clientModel.nameEnterprise.toString()),
              cardRow( title:'موظف المبيعات',value:clientModel.nameUser.toString()),
              cardRow( title:'التاريخ',value:clientModel.dateCreate.toString()),
              cardRow( title:'اسم العميل',value:clientModel.nameClient.toString()),
              cardRow( title:' المنطقة',value:clientModel.name_regoin.toString()),
              cardRow( title:' المدينة',value:clientModel.city.toString()),
              cardRow( title:' حالة العميل',value:clientModel.typeClient.toString()),
              Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              ],
          ),
            )
        ]),
      ),
    ));
  }

}
