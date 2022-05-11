import 'package:crm_smart/ui/screen/client/Acceptpage.dart';
import 'package:crm_smart/ui/screen/client/myclient.dart';
import 'package:crm_smart/ui/screen/client/tabclients.dart';
import 'package:crm_smart/ui/screen/home/approvepage.dart';
import 'package:crm_smart/ui/screen/home/widgethomeitem.dart';
import 'package:crm_smart/ui/screen/invoice/get_deleted_invoice.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';

class sales extends StatefulWidget {
  const sales({Key? key}) : super(key: key);

  @override
  _salesState createState() => _salesState();
}

class _salesState extends State<sales> {
  bool checkvalue=false;

  @override void didChangeDependencies() async{

    // Future.delayed(Duration(milliseconds: 3)).then((_) async {
    //   //checkvalue = await privilge.checkprivlge('8');
    //  // print(checkvalue);
    // });
    super.didChangeDependencies();
  }
  @override void initState() {
    Provider.of<privilge_vm>(context,listen: false).getprivlg_usercurrent();

       //Provider.of<privilge_vm>(context,listen: false).getprivlg_usercurrent();
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   Provider.of<privilge_vm>(context,listen: false).getprivlg_usercurrent();
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context)  {
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   var privilge= Provider.of<privilge_vm>(context,listen: true);
    // });

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
      body: 
      // Consumer<privilge_vm>(
      // builder: (context, privilge, child){
       Padding(
      padding: EdgeInsets.only(top: 50),
      child: Column(
            children: [
    //           Consumer<privilge_vm>(
    // builder: (context, privilge, child){
    //   return

              Provider.of<privilge_vm>(context,listen: true)
                  .checkprivlge('8')==true?
    buildSelectCategory(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>
                            tabclients()));
              }, title: ' العملاء') :Container(),
   // ;}),

    // Consumer<privilge_vm>(
    // builder: (context, privilge, child){
    // return     privilge.checkprivlge('1')==true?
    // buildSelectCategory(
    //               onTap: () {
    //             Navigator.push(context, MaterialPageRoute(
    //                 builder: (context)=>
    //                     AcceptPage()));
    //           }, title:  'العملاء المشتركين '
    // ),
              //:Container()
              // ;}),
            //AcceptPage
            // buildSelectCategory(
            //     onTap: () {
            //       Navigator.push(context, MaterialPageRoute(
            //           builder: (context)=>
            //               MyClientPage()));
            //     }, title:  'عملائي'),
              Provider.of<privilge_vm>(context,listen: true)
                  .checkprivlge('2')==true || Provider.of<privilge_vm>(context,listen: true)
                  .checkprivlge('7')==true?
    buildSelectCategory(onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>
                      ApprovePage()));
            }, title:  ' طلبات الموافقة '):Container(),

    //           privilge.checkprivlge('5')==true?
    //           buildSelectCategory(onTap: () {
    //             Navigator.push(context, MaterialPageRoute(
    //                 builder: (context)=>
    //                     ApprovePage()));
    //           }, title:  'تاركيت الموظف '):Container(),
    //
              Provider.of<privilge_vm>(context,listen: true)
                .checkprivlge('14')==true?
    buildSelectCategory(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>
                     deletedinvoice()));
                     },
                      title:  'الفواتير المحذوفة'):Container(),

          ],),
      ),
     // },),
    );
  }
}
