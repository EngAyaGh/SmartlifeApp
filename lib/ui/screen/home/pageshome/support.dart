import 'package:crm_smart/ui/screen/calendar/calendar.dart';
import 'package:crm_smart/ui/screen/calendar/event_view_page.dart';
import 'package:crm_smart/ui/screen/support/support_table.dart';
import 'package:crm_smart/ui/screen/support/support_view.dart';
import 'package:crm_smart/ui/widgets/widgetcalendar/task_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../widgethomeitem.dart';

class supportpage extends StatelessWidget {
  const supportpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          buildSelectCategory(onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=>
                    support_table()));
          }, title: 'جدول العملاء'),
          // buildSelectCategory(onTap: () {
          //   Navigator.push(context, MaterialPageRoute(
          //       builder: (context)=>
          //           TaskWidget()));
          //
          // }, title: 'Task'),

          buildSelectCategory(onTap: () {
            //
             Navigator.push(context, MaterialPageRoute(
                 builder: (context)=>
                    support_view()));
          }, title: 'العملاء المشتركين'),//تاريخ الفاتورة جنبو اسم المؤسسة
          // buildSelectCategory(onTap: () {
          //   //
          //   Navigator.push(context, MaterialPageRoute(
          //       builder: (context)=>
          //           support_table()));
          // }, title: 'جدول العملاء'),
        ],
        ),

      ),
    );
  }
}
