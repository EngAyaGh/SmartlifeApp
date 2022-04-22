


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
              cardRow('اسم المؤسسة',widget.clientModel.nameEnterprise.toString()),
              cardRow('موظف المبيعات',widget.clientModel.nameUser.toString()),
              cardRow('التاريخ',widget.clientModel.dateCreate.toString()),
              cardRow('اسم العميل',widget.clientModel.nameClient.toString()),
              cardRow(' المنطقة',widget.clientModel.name_regoin.toString()),
              cardRow(' المدينة',widget.clientModel.city.toString()),
              cardRow(' حالة العميل',widget.clientModel.typeClient.toString()),
            ],
          )
        ),
      ),
    );
  }

}
