import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/invoice_widget/Card_invoice_client.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter/cupertino.dart';

import '../../../constants.dart';

class support_view_invoices extends StatefulWidget {
  support_view_invoices({required this.itemClient,
     Key? key}) : super(key: key);

  ClientModel itemClient;
  @override
  support_view_invoicesState createState() => support_view_invoicesState();
}

class support_view_invoicesState extends State<support_view_invoices> {
  bool _isLoading=true;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<InvoiceModel> listinvoice=[];

  @override
  void initState() {
    // List<InvoiceModel> list= Provider.of<invoice_vm>(context,listen: false)
    //   .listinvoicebyregoin;
    //get info from list client_invoice فواتير العميل
    WidgetsBinding.instance!.addPostFrameCallback((_){

      // Add Your Code here.
      Provider.of<invoice_vm>(context,listen: false)
          .get_invoiceclientlocal(widget.itemClient.idClients);
    });
    // print('init invoice  '+widget.itemClient.idClients);
    //.then((value) => _isLoading=false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listinvoice=Provider.of<invoice_vm>(context,listen: true)
        .listinvoiceClient;

    print("in build invoices "+listinvoice.length.toString());
    setState(() {
      _isLoading =listinvoice.isEmpty?false:false;
    });
    print(listinvoice.length);
    return Scaffold(
      key: _scaffoldKey,
      // floatingActionButton:FloatingActionButton(
      //   backgroundColor: kMainColor,
      //   onPressed: () {
      //     Navigator.of(context).pushAndRemoveUntil(
      //         MaterialPageRoute(
      //             builder: (context) =>
      //               addinvoice(
      //                   //add new invoice
      //                   itemClient:widget.itemClient,
      //                   // iduser: widget.fkuser,
      //                   // idClient: widget.fkclient,
      //                   // indexinvoice: listinvoice.length>0?
      //                   // listinvoice.length-1:0
      //               )
      //     ), (Route<dynamic> route) => true);
      //     // Navigator.push(
      //     //     context, MaterialPageRoute(
      //     //     builder: (context)=>
      //     //     addinvoice(
      //     //         //add new invoice
      //     //         itemClient:widget.itemClient,
      //     //         iduser: widget.fkuser,
      //     //         idClient: widget.fkclient,
      //     //         indexinvoice: listinvoice.length>0?
      //     //         listinvoice.length-1:0
      //     //     )
      //     //     ));
      //   },
      //   tooltip: 'إضافة فاتورة',
      //   child: Icon(Icons.add),
      // ),
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: kWhiteColor),
      //     onPressed: (){
      //      //  Provider.of<invoice_vm>(context,listen: false)
      //      // .disposValue(-1);
      //       Navigator.of(context).pop();
      //       },
      //   ),
      //centerTitle: true,
      //   title: Text('فواتير العميل',style:
      //   TextStyle(color: kWhiteColor),
      //     textAlign: TextAlign.center,),
      // ),
      body: Padding(
        padding: const EdgeInsets.only(left:2,right: 2,top: 10,bottom: 10),
        child: ListView(
            children: [
              // CustomButton(
              //   text: 'إنشاء فاتورة جديدة',
              //   onTap: () async {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => addinvoice(
              //               //invoice: invoice,
              //                 itemClient: widget.itemClient)));
              //   },
              // ),

              Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: ListView.separated(
                  itemCount: listinvoice.length,
                  separatorBuilder: (BuildContext context, int index)
                  => const Divider(),
                  itemBuilder: (BuildContext context, int index)=>
                      Builder(builder:
                          (context)=>
                          support_add(
                            idinvoice: listinvoice[index].idInvoice,
                            // itemProd: listinvoice[index],
                            // itemClient :  widget.itemClient,
                            //scaffoldKey: _scaffoldKey,
                            //indexinvoice: index,
                          )) ,
                  //     _listProd.map(
                  //         (item) => Builder(builder: (context)=>CardProduct( itemProd: item,)) ,
                  // ).toList(),
                ),
              ),

            ]
        ),
      ),
    );}
}
