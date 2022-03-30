import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/ui/widgets/row_edit.dart';
import 'package:crm_smart/ui/widgets/text_form.dart';
import 'package:crm_smart/ui/widgets/text_uitil.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../labeltext.dart';
import 'add_invoice_product.dart';

class addinvoice extends StatefulWidget {
   addinvoice({
     this.invoice,
     required this.iduser,
     required this.idClient,
     required this.indexinvoice, Key? key}) : super(key: key);

   String? idClient,iduser;
   InvoiceModel? invoice;
  late int indexinvoice;
  @override
  _addinvoiceState createState() => _addinvoiceState();
}

class _addinvoiceState extends State<addinvoice> {
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

   final _globalKey = GlobalKey<FormState>();

   late final String  totalController ;//= TextEditingController();

   final TextEditingController amount_paidController = TextEditingController();

   final TextEditingController renewController = TextEditingController();

   late final String? typepayController ;

    String? typeinstallController;

   final TextEditingController noteController = TextEditingController();

   final TextEditingController imageController = TextEditingController();
   InvoiceModel? _invoice;
   @override
   void initState()  {
     _invoice=widget.invoice;
if(_invoice!=null){//in mode edit
  totalController=_invoice!.total.toString();
  amount_paidController.text=_invoice!.amountPaid.toString();
  renewController.text=_invoice!.renewYear.toString();
  typepayController!=_invoice!.typePay.toString();
  typeinstallController!=_invoice!.typeInstallation.toString();
  noteController.text=_invoice!.notes.toString();
  imageController.text=_invoice!.imageRecord.toString();
  Provider.of<invoice_vm>(context,listen: false)
      .listproductinvoic= _invoice!.products!;
}else{
  Provider.of<invoice_vm>(context,listen: false)
      .listinvoice.add(
      InvoiceModel(
        renewYear: renewController.text,
        typePay: typepayController,
        //"date_create": ,
        typeInstallation:typeinstallController,
        amountPaid:amount_paidController.text,

        fkIdClient:widget.idClient,
        fkIdUser:widget.iduser,

        total:totalController,
        notes:noteController.text,
      ));
  int index;
if( Provider.of<invoice_vm>(context,listen: false)
    .listinvoice.length>0) {
 index = Provider
      .of<invoice_vm>(context, listen: false)
      .listinvoice
      .length - 1;
}else index=0;
  widget.indexinvoice=index;

}
     super.initState();

   }
     @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(

        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kWhiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<LoadProvider>(context).isLoadingAddclient,
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 10,
                  right: 20,
                  left:
                  20), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Column(
                //textDirection: TextDirection.rtl,

                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // EditTextFormField(
                  //
                  //   hintText: label_total,
                  //   obscureText: false,
                  //   controller: totalController,
                  // ),



                  SizedBox(
                    height: 5,
                  ),
                  RowEdit(name: label_amount_paid, des: 'required'),
                  EditTextFormField(
                    obscureText: false,
                    hintText: label_amount_paid,
                    vaild: (value) {
                      if (value!.isEmpty) {
                        return label_empty;
                      }
                    },
                    controller: amount_paidController, //اسم المؤسسة
                    //label: label_client,
                    onChanged: (val) {
                      // nameprod = val;
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RowEdit(name: label_renew, des: 'Required'),
                  EditTextFormField(
                    hintText: label_renew,
                    obscureText: false,
                    vaild: (value) {
                      if (value!.isEmpty) {
                        return label_empty;
                      }
                    },
                    controller: renewController, //اسم المؤسسة
                    label: label_renew,
                    onChanged: (val) {
                      // nameprod = val;
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  //admin
                  RowEdit(name: label_typepay, des: 'Required'),
                 Container(
                   //padding: EdgeInsets.only(left: 1,right: 1),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.only(bottomRight: Radius.circular(12)),
                     boxShadow: <BoxShadow>[
                       BoxShadow(
                         offset: Offset(1.0, 1.0),
                         blurRadius: 8.0,
                         color: Colors.black87.withOpacity(0.2),
                       ),
                     ],
                     color: Colors.white,
                   ),
                   child: GroupButton(

                     controller: GroupButtonController(
                         selectedIndex:typepayController==null? 0:int.tryParse( typepayController!)),
                       options: GroupButtonOptions(
                           buttonWidth: 100,
                           borderRadius: BorderRadius.circular(10)),
                       buttons: ['نقدا','تحويل'],
                       onSelected: (index,isselected)=>
                       typepayController=index.toString()
                   ),
                 ),
                  //manage
                  SizedBox(
                    height: 5,
                  ),
                  RowEdit(name: label_typeinstall, des: 'Required'),
                  GroupButton(
                      controller: GroupButtonController(
                          selectedIndex: typeinstallController==null
                              ? 0 : int.tryParse( typeinstallController!)),
                      options: GroupButtonOptions(
                          buttonWidth: 100,

                          borderRadius: BorderRadius.circular(10)),
                      buttons: ['ميداني','اونلاين'],
                      onSelected: (index,isselected)=>
                      typeinstallController=index.toString()
                  ),
                  //RowEdit(name: 'Image', des: ''),
                  SizedBox(
                    height: 15,
                  ),
                  RowEdit(name: label_note, des: ''),
                  EditTextFormField(
                    maxline: 3,
                    hintText: label_note,
                    obscureText: false,
                    controller: noteController,
                  ),
                  ////////////////////////////////////////////////
                  SizedBox(
                    height: 15,
                  ),
                  RowEdit(name: label_image, des: ''),
                  //show chose image
                  EditTextFormField(
                    icon: Icons.camera,
                    hintText: label_image,
                    obscureText: false,
                    controller:imageController,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtilis(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        textstring: label_total,
                        underline: TextDecoration.none,
                      ),
                      SizedBox(width: 3,),
                      TextUtilis(
                        color: Colors.black38,
                        fontSize: 35,
                        fontWeight: FontWeight.normal,
                        textstring: Provider.of<invoice_vm>(context,listen: false)
                            .listinvoice[widget.indexinvoice].total.toString(),//totalController,
                        underline: TextDecoration.none,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Row(
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                            elevation: MaterialStateProperty.all(8),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(

                                    borderRadius: BorderRadius.circular(75))),
                            backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                            shadowColor: MaterialStateProperty.all(
                                Theme.of(context).colorScheme.onSurface),
                          ),

                          child: Text('حفظ' ,style: TextStyle(color: Colors.white),),
                          onPressed: () async {

                            if (_globalKey.currentState!.validate()) {
                              _globalKey.currentState!.save();
                              if(_invoice!=null){
                                Provider.of<invoice_vm>(context,listen: false)
                                    .update_invoiceclient_vm( {

                                  "renewYear": renewController.text,
                                  "typePay": typepayController,
                                  "date_create": DateTime.now().toString(),
                                  "typeInstallation":typeinstallController,
                                  "amountPaid":amount_paidController.text,

                                  "fkIdClient":widget.idClient,
                                  "fkIdUser":widget.iduser,

                                  "total":totalController,
                                  "notes":noteController.text,
                                  //"date_changetype":,
                                },_invoice!.idInvoice

                                ).then((value) => value!="false"
                                    ? clear(context)
                                    : error()

                                );
                              }
                              else{
                                Provider.of<invoice_vm>(context,listen: false)
                                    .add_invoiceclient_vm( {

                                  "renewYear": renewController.text,
                                  "typePay": typepayController,
                                  //"date_create": ,
                                  "typeInstallation":typeinstallController,
                                  "amountPaid":amount_paidController.text,

                                  "fkIdClient":widget.idClient,
                                  "fkIdUser":widget.iduser,

                                  "total":totalController,
                                  "notes":noteController.text,
                                  //"date_changetype":,
                                },

                                ).then((value) => value!="false"
                                    ? clear(context)
                                    : error()

                                );
                              }


                            }
                          },
                        ),
                        ElevatedButton
                          (  //منتجات الفاتورة
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    kMainColor)),
                            onPressed: () {
                              if(_invoice==null){

                                // Provider.of<invoice_vm>(context,listen: false)
                                //  .listinvoice.
                                //       {
                                //       renewYear: renewController.text,
                                //       typePay: typepayController,
                                //       //"date_create": ,
                                //       typeInstallation:typeinstallController,
                                //       amountPaid:amount_paidController.text,
                                //
                                //       fkIdClient:widget.idClient,
                                //       fkIdUser:widget.iduser,
                                //
                                //       total:totalController,
                                //       notes:noteController.text,}
                                //     ));
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=>
                                      add_invoiceProduct(
                                        invoice:
                                        Provider.of<invoice_vm>(context,listen: false)
                                            .listinvoice[widget.indexinvoice],
                                       indexinvoic:  widget.indexinvoice,
                                      )
                              ));
                            }

                            else{

                        Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>
                        add_invoiceProduct(
                        invoice:_invoice,
                            indexinvoic:
                            widget.indexinvoice,
                        // Provider.of<invoice_vm>(context,listen: false)
                        //     .listinvoice[index],
                        )
                        ));
                        }},
                            child: Text("منتجات الفاتورة")),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  clear(BuildContext context) {}

  error() {}
}
