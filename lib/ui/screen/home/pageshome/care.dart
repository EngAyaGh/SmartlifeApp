import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:flutter/cupertino.dart';
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
    Provider.of<privilge_vm>(context,listen: false).getprivlg_usercurrent();
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
        Column(children: [
          Provider.of<privilge_vm>(context,listen: true)
              .checkprivlge('9')==true?
          buildSelectCategory(onTap: () {

          }, title: 'العناية بالعملاء'):Container(),

          Provider.of<privilge_vm>(context,listen: true)
              .checkprivlge('29')==true?
          buildSelectCategory(onTap: () {

          }, title: 'الترحيب بالعملاء'):Container(),

          Provider.of<privilge_vm>(context,listen: true)
              .checkprivlge('30')==true?
          buildSelectCategory(onTap: () {

          }, title: ' جودة التركيب والتدريب'):Container(),

        ],),

      ),
    );
  }
}
