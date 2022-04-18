
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/ui/screen/home/build_card.dart';
import 'package:crm_smart/ui/widgets/custom_widget/appbar.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customDrawer.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void didChangeDependencies() {
    Provider.of<user_vm_provider>(context,listen: false)
        .getcurrentuser();
    //check level user
    Provider.of<client_vm>(context, listen: false)
        .getclientByRegoin([]);
    //level user all client in country
    // Provider.of<client_vm>(context, listen: false)
    //     . getclient_vm();
    Provider.of<invoice_vm>(context, listen: false)
        .get_invoicesbyRegoin([]);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    var sizeh=MediaQuery.of(context).size.height;
     var paddval=1.0;
    paddval= sizeh/3;
    return Scaffold(

      //drawerScrimColor: Colors.white,
      backgroundColor: Colors.grey[200],
      appBar:customAppbar(),
      drawer: Theme(
        data:  Theme.of(context).copyWith(
          canvasColor: Colors.white, //This will change the drawer background to blue.
          //other styles
        ),
        child:       CustomDrawer(),

      ),
      // AppBar(
      //   title: Text('الرئيسية',style: TextStyle(color: kWhiteColor),),
      //   centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: kMainColor,
      // ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: BuildCard(),
        ),
      ),
    );
  }
}
