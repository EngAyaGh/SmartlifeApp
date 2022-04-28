

import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import 'clientView.dart';
class ProfileClient extends StatefulWidget {
  ProfileClient({Key? key}) : super(key: key);

  @override
  _ProfileClientState createState() => _ProfileClientState();
}

class _ProfileClientState extends State<ProfileClient> with TickerProviderStateMixin{
  late UserModel current ;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late ClientModel _clientModel;
  late InvoiceModel _invoiceModel;
  @override
  Widget build(BuildContext context) {
    current = Provider.of<user_vm_provider>(context).currentUser!;
    int _tabBarIndex = 0;
    TabController _tabcontroller=TabController(length: 2, vsync: this);
    return DefaultTabController(
      length: 2,
      child:Scaffold(

        appBar: AppBar(
          backgroundColor: kMainColor,title:Text('ملف العميل',style: TextStyle(color: kWhiteColor),) ,centerTitle: true,),
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 8),
              child: Container(
                margin: EdgeInsets.only(bottom: 8,),
                child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 10,right: 10,top: 2),
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: _tabcontroller,
                  indicatorColor: kWhiteColor,
                  indicatorWeight: 5,
                  indicator: BoxDecoration(
                    color: kMainColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  //isScrollable: true,
                  tabs: <Widget>[

                    Text(
                      'بيانات العميل',
                      // style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     color: _tabBarIndex == 0 ?kMainColor : kUnActiveColor,
                      //     fontSize: _tabBarIndex == 0 ? 20 : null,
                      //     decorationStyle: TextDecorationStyle.double
                      // ),
                    ),
                    Text(
                      'الفاتورة ',
                      // style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     color: _tabBarIndex == 1?kMainColor : kUnActiveColor,
                      //     fontSize: _tabBarIndex == 1 ? 20 : null,
                      //     decorationStyle: TextDecorationStyle.double
                      // ),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 1),
              padding: const EdgeInsets.only(top:2,left: 15,right: 15),
              height: MediaQuery.of(context).size.height*0.75,
              child: TabBarView(
                controller: _tabcontroller,
                children: <Widget>[
                  ClientView(clientModel: _clientModel),
                  //InvoiceView(invoice: _invoiceModel,),
                  //Icon(Icons.add),
                ],
              ),
            ),
            //SizedBox(height: 6,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(kMainColor)),
                      onPressed: () async{

                          },

                      child: Text('Approve')),
                  SizedBox(
                    width: 4,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.redAccent)),
                      onPressed: ()  async{
                      },
                      child: Text('Refuse')),

                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
