import 'package:crm_smart/ui/screen/client/Acceptpage.dart';
import 'package:crm_smart/ui/screen/client/tabclients.dart';
import 'package:crm_smart/ui/screen/home/approvepage.dart';
import 'package:crm_smart/ui/screen/home/widgethomeitem.dart';
import 'package:crm_smart/ui/screen/invoice/get_deleted_invoice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class sales extends StatelessWidget {
  const sales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
         '',
          style: TextStyle(
              fontFamily: kfontfamily2),
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child:
        Column(children: [
          buildSelectCategory(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>
                        tabclients()));
          }, title: 'كل العملاء'),
          buildSelectCategory(
              onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=>
                    AcceptPage()));
          }, title:  'العملاء المشتركين '),
          //AcceptPage

          buildSelectCategory(onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=>
                    ApprovePage()));
          }, title:  'كل طلبات الموافقة '),

          buildSelectCategory(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>
                   deletedinvoice()));
                   },
                    title:  'الفواتير المحذوفة'),

        ],),

      ),
    );
  }
}
