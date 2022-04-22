import 'package:crm_smart/constantsList.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/widgets/cardapprove.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardapprove1.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardclientAccept.dart';
import 'package:crm_smart/view_model/approve_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
class AcceptPage extends StatefulWidget {
  const AcceptPage({Key? key}) : super(key: key);

  @override
  _ApprovePageState createState() => _ApprovePageState();
}

class _ApprovePageState extends State<AcceptPage> {
  @override
  void initState() {
    //Provider.of<notifyvm>(context,listen: false).getNotification();
    super.initState();
  }
  @override
  void didChangeDependencies() async{
    //List<ClientModel> list= Provider.of<client_vm>(context).listClient;
    await    Provider.of<invoice_vm>(context, listen: false)
        .getinvoice_Local("مشترك");
    // Future.delayed(Duration(milliseconds: 10)).then((_) async {
    //   await    Provider.of<invoice_vm>(context, listen: false)
    //       .getinvoice_Local("مشترك");
    // }
    // );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,title:Text( 'العملاء المشتركين ',
        style:
        TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: ListView(
                children: [
                   search_widget("المؤسسة....",
                     Provider.of<invoice_vm>(context, listen: true)
                         .listInvoicesAccept,),
                 SizedBox(height: 5,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.73,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Consumer<invoice_vm> (
                          builder: (context,value,child) {
                            return value.listInvoicesAccept.length==0?
                            CircularProgressIndicator()
                                :Expanded(
                                  child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: value.listInvoicesAccept.length,
                                  itemBuilder: (context, index) {

                                    return SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: cardClientAccept(
                                            iteminvoice :
                                            value.listInvoicesAccept[index],
                                          ),
                                        ));
                                  }),
                                );
                          } ),
                    ),
                  ),
                ],
              )  ),
        ),
      ),
    );
  }
}
