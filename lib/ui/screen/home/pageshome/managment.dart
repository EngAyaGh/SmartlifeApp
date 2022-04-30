import 'package:crm_smart/ui/screen/privilges/checklevel.dart';
import 'package:crm_smart/ui/screen/product/productView.dart';
import 'package:crm_smart/ui/screen/user/alluser.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants.dart';
import '../widgethomeitem.dart';

class managmentpage extends StatefulWidget {
  const managmentpage({Key? key}) : super(key: key);

  @override
  _managmentpageState createState() => _managmentpageState();
}

class _managmentpageState extends State<managmentpage> {
  @override void didChangeDependencies() {
    Provider.of<privilge_vm>(context,listen: false).getprivlg_usercurrent();

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
            privilge.checkprivlge('3')==true?   buildSelectCategory(
                onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>
                      AllUserScreen()));
            }, title: 'إدارة المستخدمين'):Container(),

            privilge.checkprivlge('17')==true? buildSelectCategory(onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>
                      check_level()));
            }, title: 'ادارة الصلاحيات'):Container(),

            privilge.checkprivlge('4')==true?  buildSelectCategory(onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context)
                  => ProductView(),
                  fullscreenDialog: true,
                ),
              );
            }, title: 'المنتجات '):Container(),
          ],);}
        ),

      ),
    );
  }
}
