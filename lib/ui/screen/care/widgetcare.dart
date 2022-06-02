import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_expansion.dart';
import 'package:flutter/cupertino.dart';

import '../../../function_global.dart';

Widget commview(CommunicationModel element) {
  if(element.idCommunication!=''){
    return buildcardExpansion(
        get_title_care(element.typeCommuncation.toString())+'(فاتورة ${element.date_create})', '',
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              element.typeCommuncation=='ترحيب'?
              cardRow(title:'تم الترحيب من قبل' ,
                value:getnameshort(element.nameUser.toString()) ,):Container(),
              element.typeCommuncation=='ترحيب'?
              cardRow(title:'تاريخ الترحيب بالعميل' ,value: element.dateCommunication.toString(),):Container(),
              element.typeCommuncation=='تركيب'?
              cardRow(title:'تم التأكد من جودة التركيب من قبل' ,
                value:getnameshort(element.nameUser.toString()) ,):Container(),
              element.typeCommuncation=='تركيب'?
              cardRow(title:'تاريخ التأكد من التركيب للعميل' ,value: element.dateCommunication.toString(),):Container(),
              element.typeCommuncation=='تركيب'?
              cardRow(title:' نتيجة التواصل' ,value: element.result.toString(),):Container(),


              element.typeCommuncation=='دوري'?
              cardRow(title:'موظف التقييم' ,value:getnameshort(element.nameUser.toString()) ,):Container(),
              element.typeCommuncation=='دوري'?
              cardRow(title:'تاريخ التقييم' ,value: element.dateCommunication.toString(),):Container(),
              element.typeCommuncation=='دوري'?
              cardRow(title:'مستوى التقييم' ,value: element.rate.toString(),):Container(),


            ],
          ),
        )
    );}
  else return Container();
}