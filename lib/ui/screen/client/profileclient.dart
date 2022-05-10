

import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/care/comment_view.dart';
import 'package:crm_smart/ui/screen/invoice/invoces.dart';
import 'package:crm_smart/ui/screen/invoice/invoiceView.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import 'clientView.dart';
class ProfileClient extends StatefulWidget {
  ProfileClient({required this.idclient, Key? key}) : super(key: key);
String? idclient;
  @override
  _ProfileClientState createState() => _ProfileClientState();
}

class _ProfileClientState extends State<ProfileClient> with TickerProviderStateMixin{
  late UserModel current ;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late ClientModel _clientModel;
  late InvoiceModel? _invoiceModel;
  late TabController _tabcontroller;

@override void initState() {

    super.initState();
    Provider.of<invoice_vm>(context,listen: false)
        .get_invoiceclientlocal(widget.idclient);

    _clientModel=Provider.of<client_vm>(context,listen: false).listClient
    .firstWhere((element) => element.idClients==widget.idclient);

    _invoiceModel=Provider.of<invoice_vm>(context,listen: false).listinvoices
        .firstWhere((element) => element.fkIdClient==widget.idclient);
    _tabcontroller= TabController(length: 4, vsync: this,initialIndex: 0);

}
  @override
  Widget build(BuildContext context) {
    current = Provider.of<user_vm_provider>(context).currentUser!;
    int _tabBarIndex = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,title:Text('ملف العميل',
        style: TextStyle(color: kWhiteColor,fontFamily: kfontfamily2),) ,
        centerTitle: true,
        bottom: TabBar(
          // indicatorPadding: EdgeInsets.only(top: 20),
          labelPadding: const EdgeInsets.only(left: 2,right: 2,),
          indicatorSize: TabBarIndicatorSize.label,
          controller: _tabcontroller,
          indicatorColor: kWhiteColor,
          indicatorWeight: 5,

          // indicator: BoxDecoration(
          //   color: kWhiteColor,
          //   borderRadius: BorderRadius.circular(2),
          // ),
          labelColor: Colors.white,
          unselectedLabelColor: kWhiteColor,
          //isScrollable: true,

          tabs: <Widget>[
            Text(
              'بيانات ',
               style: TextStyle(
                  fontFamily: kfontfamily2,
                  //fontWeight: FontWeight.bold,
                  //color: _tabBarIndex == 0 ?kWhiteColor : kUnActiveColor,
                  //fontSize: _tabBarIndex == 0 ? 30 : 2,
                  //decorationStyle: TextDecorationStyle.double
              ),
            ),
            Text(
              'الفواتير ',
              style: TextStyle(
              fontFamily: kfontfamily2,
                  //fontWeight: FontWeight.bold,
                  //color: _tabBarIndex == 1?kMainColor : kUnActiveColor,
                  //fontSize: _tabBarIndex == 1 ? 30 : null,
                  //decorationStyle: TextDecorationStyle.double
              ),
            ),
            Text(
              'التعليقات ',
              style: TextStyle(
                fontFamily: kfontfamily2,
                //fontWeight: FontWeight.bold,
                //color: _tabBarIndex == 1?kMainColor : kUnActiveColor,
               // fontSize: _tabBarIndex == 2 ? 20 : null,
                //decorationStyle: TextDecorationStyle.double
              ),
            ),
            Text(
              ' الدعم الفني ',
              style: TextStyle(
                fontFamily: kfontfamily2,
                //fontWeight: FontWeight.bold,
                //color: _tabBarIndex == 1?kMainColor : kUnActiveColor,
                //fontSize: _tabBarIndex == 3 ? 20 : null,
                //decorationStyle: TextDecorationStyle.double
              ),
            ),
          ],
        ),
      ),
      body:

          Container(
            margin: EdgeInsets.only(bottom: 1),
            padding: const EdgeInsets.only(top:25,left: 5,right: 5),
            height: MediaQuery.of(context).size.height*0.85,
            child: TabBarView(
              controller: _tabcontroller,
              children: <Widget>[
                ClientView(clientModel: _clientModel),
                // invoices(
                //   itemClient: _clientModel,
                //   fkclient: _clientModel.idClients.toString(),
                //   fkuser: '',),
                InvoiceView(
                    invoice: _invoiceModel,
                clientmodel: _clientModel,
                ),
                commentView( fk_client:_clientModel.idClients.toString(),nameEnterprise: _clientModel.nameEnterprise),
                support_add( idinvoice: _invoiceModel!.idInvoice,),
                //InvoiceView(invoice: _invoiceModel,),
                //Icon(Icons.add),
              ],
            ),
          ),

    );
  }
}
