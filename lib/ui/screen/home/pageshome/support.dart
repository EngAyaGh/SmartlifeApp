import 'package:crm_smart/ui/screen/calendar/calendar.dart';
import 'package:crm_smart/ui/screen/calendar/event_view_page.dart';
import 'package:crm_smart/ui/screen/support/support_table.dart';
import 'package:crm_smart/ui/screen/support/support_view.dart';
import 'package:crm_smart/ui/widgets/widgetcalendar/task_widget.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants.dart';
import '../widgethomeitem.dart';

class supportpage extends StatefulWidget {
  const supportpage({Key? key}) : super(key: key);

  @override
  _supportpageState createState() => _supportpageState();
}

class _supportpageState extends State<supportpage> {
  @override void didChangeDependencies() async{

    Future.delayed(Duration(milliseconds: 3)).then((_) async {
      Provider.of<privilge_vm>(context,listen: false).getprivlg_usercurrent();

    });
    super.didChangeDependencies();
  }
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
        Consumer<privilge_vm>(
    builder: (context, privilge, child){
         return Column(children: [

            // buildSelectCategory(onTap: () {
            //   Navigator.push(context, MaterialPageRoute(
            //       builder: (context)=>
            //           TaskWidget()));
            //
            // }, title: 'Task'),

           privilge.checkprivlge('19')==true?
           buildSelectCategory(onTap: () {
              //
               Navigator.push(context, MaterialPageRoute(
                   builder: (context)=>
                      support_view()));
            }, title: 'العملاء المشتركين'):Container(),//تاريخ الفاتورة جنبو اسم المؤسسة

           privilge.checkprivlge('18')==true?
           buildSelectCategory(onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>
                      support_table()));
            }, title: 'جدول العملاء'):Container(),
            // buildSelectCategory(onTap: () {
            //   //
            //   Navigator.push(context, MaterialPageRoute(
            //       builder: (context)=>
            //           support_table()));
            // }, title: 'جدول العملاء'),
          ],
          );}

        ),

      ),
    );
  }
}
