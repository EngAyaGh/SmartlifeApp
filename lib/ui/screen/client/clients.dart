import 'package:crm_smart/api/fcm.dart';
import 'package:crm_smart/model/approvemodel.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/client/clientView.dart';
import 'package:crm_smart/ui/screen/client/tabclients.dart';
import 'package:crm_smart/ui/screen/home/approvepage.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';
import 'package:crm_smart/ui/screen/invoice/add_invoice_product.dart';
import 'package:crm_smart/ui/screen/invoice/invoiceView.dart';
import 'package:crm_smart/ui/widgets/custom_widget/bottomnavigatorbar.dart';
import 'package:crm_smart/ui/widgets/custom_widget/tabar.dart';
import 'package:crm_smart/ui/widgets/custom_widget/tabview.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/approve_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import 'addClient.dart';
import 'package:get/get.dart';

class client_dashboard extends StatefulWidget {
   client_dashboard({required this.itemapprove, Key? key}) : super(key: key);
ApproveModel itemapprove;


  @override
  State<StatefulWidget> createState() => _client_dashboard();
}
  class _client_dashboard extends State<client_dashboard> with TickerProviderStateMixin{
  // final controllerUsers = Get.find<AllUserVMController>();
    late UserModel current ;
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    late ClientModel _clientModel;
    late InvoiceModel _invoiceModel;
    Widget _switchcaseBody(int _selectedIndex){
      var _selectedView;
      switch(_selectedIndex){
        case 0:
          _selectedView=customtabview();
          break;
        case 1:
          _selectedView=Icon(
            Icons.camera,
            size: 150,
          );
          break;
        case 2:
          _selectedView=    Icon(
            Icons.chat,
            size: 150,
          );
          break;
      }
      return _selectedView;
    }
    PreferredSizeWidget _switchcaseAppBar(int _selectedIndex){
    var _selectedView;
    switch(_selectedIndex){
      case 0:
          _selectedView=AppBar( backgroundColor: Colors.white,
          elevation: 0,
          bottom: customtabBar(),);
        break;
      case 1:
        _selectedView=AppBar();
        break;
      case 2:
        _selectedView=AppBar();
        break;
    }
    return _selectedView;
  }

    @override
    void initState()  {
      //check level user
      Provider.of<client_vm>(context, listen: false)
          .getclientByRegoin([]);//list empty that mean
      //level user all client in country
      // Provider.of<client_vm>(context, listen: false)
      //     . getclient_vm();
      // Provider.of<invoice_vm>(context, listen: false)
      //     .get_invoicesbyRegoin([]);

      _invoiceModel= Provider.of<invoice_vm>(context, listen: false)
          .get_byIdInvoice(widget.itemapprove.fk_invoice.toString())!;

      _clientModel= Provider.of<client_vm>(context, listen: false)
          .get_byIdClient(widget.itemapprove.fkClient.toString()
      )!;
      print("init tabbar");
      super.initState();
  }
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   //crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Text('120',
                  //       style: TextStyle(
                  //       color: _tabBarIndex == 0 ? kMainColor : kUnActiveColor,
                  //       fontSize: _tabBarIndex == 0 ? 10 : null,
                  //           height:0.2,
                  //           fontWeight: FontWeight.bold,
                  //           //decoration: TextDecoration.underline,
                  //           //decorationThickness: 2,
                  //
                  //           decorationStyle: TextDecorationStyle.double
                  //     ),),
                  //     //Icon(Icons.category,color: kMainColor,),
                  //     SizedBox(width: 5,),
                  //
                  //   ],
                  // ),
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
                  InvoiceView(invoice: _invoiceModel,),
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
                        bool result = await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(''),
                              content: Text('تأكيد العملية'),
                              actions: <Widget>[
                                new ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          kMainColor)),
                                  onPressed: () {
                                    Navigator.of(context,
                                        rootNavigator: true)
                                        .pop(
                                        false); // dismisses only the dialog and returns false
                                  },
                                  child: Text('لا'),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          kMainColor)),
                                  onPressed: () async {
                                    Navigator.of(context,
                                        rootNavigator: true)
                                        .pop(true);
                                    // update client to approved client
                                    Provider.of<client_vm>(context, listen: false)
                                        .setApproveclient_vm({
                                      'idApproveClient':widget.itemapprove.idApproveClient,
                                      "fk_user":widget.itemapprove.fkUser,//صاحب العميل
                                      "fk_regoin":widget.itemapprove.fk_regoin,
                                      "fk_country":widget.itemapprove.fk_country,
                                      "isApprove": "1",
                                      "name_enterprise":widget.itemapprove.name_enterprise,
                                      "fkusername":widget.itemapprove.nameUser, //موظف المبيعات
                                      //"message":"",//
                                      "nameuserApproved":current.nameUser,
                                      "iduser_approve": current.idUser//معتمد الاشتراك
                                    }, widget.itemapprove.fkClient).then((value) => value!=false?
                                    Provider.of<approve_vm>(context,listen: false)
                                        .removeApproveClient(widget.itemapprove.idApproveClient)
                                        :  _scaffoldKey.currentState!.showSnackBar(
                                        SnackBar(content: Text('هناك مشكلة ما')))
                                    );
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                            (context)=>ApprovePage()));
                                  },
                                  child: Text('نعم'),
                                ),
                              ],
                            );
                          },
                        );

                        //Navigator.pop(context);
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
                        bool result = await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(''),
                              content: Text('تأكيد العملية  '),
                              actions: <Widget>[
                                new ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          kMainColor)),
                                  onPressed: () {
                                    Navigator.of(context,
                                        rootNavigator: true)
                                        .pop(
                                        false); // dismisses only the dialog and returns false
                                  },
                                  child: Text('لا'),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          kMainColor)),
                                  onPressed: () async {
                                    Provider.of<client_vm>(context, listen: false)
                                        .setApproveclient_vm({
                                      'idApproveClient':widget.itemapprove.idApproveClient,
                                      "fk_user":widget.itemapprove.fkUser,
                                      "fk_regoin":widget.itemapprove.fk_regoin,
                                      "fk_country":widget.itemapprove.fk_country,
                                      "isApprove": "0",
                                      "name_enterprise":widget.itemapprove.name_enterprise,
                                      "fkusername":widget.itemapprove.nameUser, //موظف المبيعات
                                      //"message":"",//
                                      "nameuserApproved":current.nameUser,
                                      "iduser_approve": current.idUser//معتمد الاشتراك
                                    }, widget.itemapprove.fkClient)
                                        .then((value) =>
                                    value!=false?
                                    Provider.of<approve_vm>(context,listen: false)
                                        .removeApproveClient(widget.itemapprove.idApproveClient)
                                        :   _scaffoldKey.currentState!.showSnackBar(
                                        SnackBar(content: Text('هناك مشكلة ما'))
                                    )
                                    );
                                    Navigator.of(context,
                                        rootNavigator: true)
                                        .pop(true);
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                            (context)=>ApprovePage()));


                                  },
                                  child: Text('نعم'),
                                ),
                              ],
                            );
                          },
                        );
                        //send notification
                                               //Navigator.pop(context);
                      },
                      child: Text('Refuse')),

                ],
              ),
            ),
          ],
        ),
       //  appBar: _switchcaseAppBar(0),

       // body:_switchcaseBody(0),
      //   floatingActionButton: FloatingActionButton(
      //     backgroundColor: kMainColor,
      // onPressed: (){
      //
      //   Navigator.push(context, MaterialPageRoute(
      //       builder: (context)=>addClient()));
      //
      // },
      // tooltip: 'إضافة عميل',
      // child: Icon(Icons.add),
        //),
      ),
      );
    }
  }

