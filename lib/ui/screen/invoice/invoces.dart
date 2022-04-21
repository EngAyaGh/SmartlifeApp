import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';
import 'package:crm_smart/ui/widgets/invoice_widget/Card_invoice_client.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter/cupertino.dart';

import '../../../constants.dart';

class invoices extends StatefulWidget {
   invoices({required this.itemClient, required this.fkclient,required this.fkuser, Key? key}) : super(key: key);
   String fkclient,fkuser;
   ClientModel itemClient;
  @override
  _invoicesState createState() => _invoicesState();
}

class _invoicesState extends State<invoices> {
   bool _isLoading=true;
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

   List<InvoiceModel> listinvoice=[];

   @override
   void initState() {
   // List<InvoiceModel> list= Provider.of<invoice_vm>(context,listen: false)
   //   .listinvoicebyregoin;
     //get info from list client_invoice فواتير العميل
     Provider.of<invoice_vm>(context,listen: false)
         .get_invoiceclientlocal(widget.fkclient);

     print('init invoice  '+widget.fkclient);
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
       floatingActionButton:FloatingActionButton(
         backgroundColor: kMainColor,
         onPressed: () {
           Navigator.of(context).pushAndRemoveUntil(
               MaterialPageRoute(
                   builder: (context) =>
                     addinvoice(
                         //add new invoice
                         itemClient:widget.itemClient,
                         // iduser: widget.fkuser,
                         // idClient: widget.fkclient,
                         // indexinvoice: listinvoice.length>0?
                         // listinvoice.length-1:0
                     )
           ), (Route<dynamic> route) => true);
           // Navigator.push(
           //     context, MaterialPageRoute(
           //     builder: (context)=>
           //     addinvoice(
           //         //add new invoice
           //         itemClient:widget.itemClient,
           //         iduser: widget.fkuser,
           //         idClient: widget.fkclient,
           //         indexinvoice: listinvoice.length>0?
           //         listinvoice.length-1:0
           //     )
           //     ));
         },
         tooltip: 'إضافة فاتورة',
         child: Icon(Icons.add),
       ),
       appBar: AppBar(
         leading: IconButton(
           icon: Icon(Icons.arrow_back, color: kWhiteColor),
           onPressed: (){
            //  Provider.of<invoice_vm>(context,listen: false)
            // .disposValue(-1);
             Navigator.of(context).pop();
             },
         ),
        centerTitle: true,
         title: Text('فواتير العميل',style:
         TextStyle(color: kWhiteColor),
           textAlign: TextAlign.center,),
       ),
       body: _isLoading?
       Center(child: CircularProgressIndicator(),)
           :(listinvoice.isEmpty
           ? Center(child: Text('لا يوجد فواتير لهذا العميل',style: TextStyle(fontSize: 22,color: kWhiteColor),),)
           :Padding(
         padding: const EdgeInsets.only(left:20,right: 20,top: 10,bottom: 10),
         child: Container(
           height: MediaQuery
               .of(context)
               .size
               .height *0.95,
           child: ListView.separated(
             itemCount: listinvoice.length,
             separatorBuilder: (BuildContext context, int index)
             => const Divider(),
             itemBuilder: (BuildContext context, int index)=>
                 Builder(builder:
                     (context)=>
                         CardInvoiceClient(
                         itemProd: listinvoice[index],
                           itemClient :  widget.itemClient,
                         //scaffoldKey: _scaffoldKey,
                         //indexinvoice: index,
                         )) ,
             //     _listProd.map(
             //         (item) => Builder(builder: (context)=>CardProduct( itemProd: item,)) ,
             // ).toList(),
           ),
         ),
       )
       ),
     );
   }
}
