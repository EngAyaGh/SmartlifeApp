import 'package:crm_smart/constantsList.dart';
import 'package:crm_smart/ui/widgets/cardapprove.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardapprove1.dart';
import 'package:crm_smart/view_model/approve_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
class ApprovePage extends StatefulWidget {
  const ApprovePage({Key? key}) : super(key: key);

  @override
  _ApprovePageState createState() => _ApprovePageState();
}

class _ApprovePageState extends State<ApprovePage> {
  @override
  void initState() {
    //Provider.of<notifyvm>(context,listen: false).getNotification();
    super.initState();
  }
  @override
  void didChangeDependencies() {

    Future.delayed(Duration(milliseconds: 10)).then((_) async {
      await    Provider.of<approve_vm>(context, listen: false)
          .getApprovebyregoin();
    }
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,title:Text( 'طلبات الموافقة',
        style:
      TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: Center(
              child:
              Consumer<approve_vm> (
                  builder: (context,value,child) {
                    return value.listapprove.length==0?
                    CircularProgressIndicator()
                        :ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: value.listapprove.length,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: cardapprove1(
                                  itemapprove :
                                  value.listapprove[index],
                                ),
                              ));
                        });
                  } ),
            )  ),
      ),
    );
  }
}
