


import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClientView extends StatefulWidget {
   ClientView( {required this.clientModel, Key? key}) : super(key: key);
  ClientModel clientModel;
  @override
  _ClientViewState createState() => _ClientViewState();
}

class _ClientViewState extends State<ClientView> {
  @override
  Widget build(BuildContext context) {
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
              cardRow(  title: 'اسم المؤسسة',value:widget.clientModel.nameEnterprise.toString()),
              cardRow( title:'موظف المبيعات',value:widget.clientModel.nameUser.toString()),
              cardRow( title:'التاريخ',value:widget.clientModel.dateCreate.toString()),
              cardRow( title:'اسم العميل',value:widget.clientModel.nameClient.toString()),
              cardRow( title:' المنطقة',value:widget.clientModel.name_regoin.toString()),
              cardRow( title:' المدينة',value:widget.clientModel.city.toString()),
              cardRow( title:' حالة العميل',value:widget.clientModel.typeClient.toString()),
            ],
          )
        ),
      ),
    );
  }

}
