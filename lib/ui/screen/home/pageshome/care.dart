import 'package:crm_smart/ui/screen/home/ticket/ticketclientview.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants.dart';
import '../widgethomeitem.dart';

class carepage extends StatefulWidget {
  const carepage({Key? key}) : super(key: key);

  @override
  _carepageState createState() => _carepageState();
}

class _carepageState extends State<carepage> {
  @override void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_)async {
      Provider.of<privilge_vm>(context, listen: false).getprivlg_usercurrent();
      Provider.of<ticket_vm>(context,listen: false)
          .getclientticket_filter('جديدة');
      Provider.of<communication_vm>(context, listen: false)
          .getCommunicationInstall();
      Provider.of<communication_vm>(context, listen: false)
          .getCommunicationWelcome();
    });
    super.initState();
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
        Column(

          children: [
          Provider.of<privilge_vm>(context,listen: true)
              .checkprivlge('9')==true?
          buildSelectCategory(
              colorbag: Colors.white,
              colortitle: Colors.black,
              colorarrow: Colors.black,
              onTap: () {

          }, title: 'العناية بالعملاء'):Container(),

          Provider.of<privilge_vm>(context,listen: true)
              .checkprivlge('29')==true?
          buildSelectCategory(
            subtitle:   Provider.of<communication_vm>
              (context, listen: true).listCommunicationWelcome.length.toString(),
              colorbag: Colors.white,
              colortitle: Colors.black,
              colorarrow: Colors.black,
              onTap: () {

          }, title: 'الترحيب بالعملاء'):Container(),

          Provider.of<privilge_vm>(context,listen: true)
              .checkprivlge('30')==true?
          buildSelectCategory(
            subtitle:   Provider.of<communication_vm>(
                context, listen: true).listCommunicationInstall.length.toString(),
              colorbag: Colors.white,
              colortitle: Colors.black,
              colorarrow: Colors.black,
              onTap: () {

          }, title: ' جودة التركيب والتدريب'):Container(),

          Provider.of<privilge_vm>(context,listen: true)
              .checkprivlge('33')==true?
          buildSelectCategory(
            subtitle: Provider.of<ticket_vm>(context,listen: true)
                .listticket_clientfilter.length.toString(),
              colorbag: Colors.white,
              colortitle: Colors.black,
              colorarrow: Colors.black,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>
                        ticketclientview()));
              }, title: 'تذاكر العملاء  '
              ):Container(),

        ],),

      ),
    );
  }
}
