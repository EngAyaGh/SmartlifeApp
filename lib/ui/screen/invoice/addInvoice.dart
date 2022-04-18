import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/notify_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as myui;
import '../../../constants.dart';
import '../../../labeltext.dart';
import 'add_invoice_product.dart';

class addinvoice extends StatefulWidget {
   addinvoice({
     required this.itemClient,
     this.invoice,
     required this.iduser,
     required this.idClient,
     required this.indexinvoice,
     Key? key}) : super(key: key);
   ClientModel itemClient;
   String? idClient,iduser;
   InvoiceModel? invoice;
  late int indexinvoice;
  @override
  _addinvoiceState createState() => _addinvoiceState();
}

class _addinvoiceState extends State<addinvoice> {
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

   final _globalKey = GlobalKey<FormState>();

   late  String  totalController ;//= TextEditingController();

   final TextEditingController amount_paidController = TextEditingController();

   final TextEditingController renewController = TextEditingController();

   late  String? typepayController='0' ;

   late String? typeinstallController='0';

   final TextEditingController noteController = TextEditingController();

   final TextEditingController imageController = TextEditingController();
   InvoiceModel? _invoice;
@override void dispose() {
  print("length ${Provider.of<invoice_vm>(context,listen: false)
      .listinvoiceClient.length}");
  print("widget.indexinvoice  ${widget.indexinvoice}");

  print("in on pop addinvoice screen "
      +Provider.of<invoice_vm>(context,listen: false)
          .listinvoiceClient[widget.indexinvoice].idInvoice.toString());

  if(Provider.of<invoice_vm>(context,listen: false)
      .listinvoiceClient[widget.indexinvoice].idInvoice == null
  // ||
  // int.tryParse(Provider.of<invoice_vm>(context,listen: false)
  // .listinvoice[widget.indexinvoice].idInvoice.toString())!>0
  ) {
    //clear cach invoice with it's product's
    Provider.of<invoice_vm>(context,listen: false)
        .listproductinvoic=[];
    Provider.of<invoice_vm>(context,listen: false)
        .listinvoiceClient[widget.indexinvoice].products=[];
    if(widget.indexinvoice==0)
      Provider.of<invoice_vm>(context,listen: false)
          .disposValue(-1);
    else{
      Provider.of<invoice_vm>(context,listen: false)
          .disposValue(widget.indexinvoice);
    }

    widget.indexinvoice=
    widget.indexinvoice-1<=0?
    0:
    widget.indexinvoice-1;

  } else {
    //
    // Provider.of<invoice_vm>(context,listen: false)
    //     .listproductinvoic=[];
    //
    // Provider.of<invoice_vm>(context,listen: false)
    //     .listinvoiceClient[widget.indexinvoice]
    //     .products=[];
    // Provider.of<invoice_vm>(context,listen: false)
    //     .listinvoiceClient.removeAt(widget.indexinvoice);
    // widget.indexinvoice=0;
  }
    super.dispose();
  }
   @override
   void initState()  {
     print('init in addinvoice screen main');
     totalController='0';
     _invoice=widget.invoice;
if(_invoice!=null){
  //in mode edit
  totalController=_invoice!.total.toString();

  amount_paidController.text=_invoice!.amountPaid.toString();
  renewController.text=_invoice!.renewYear.toString();
 // setState(() {
    typepayController!=_invoice!.typePay;
  //   Provider.of<selected_button_provider>(context,listen: false)
  //       .selectValuetypepay(int.parse(typepayController!));
  // print(typepayController);

    typeinstallController!=_invoice!.typeInstallation;
  // Provider.of<selected_button_provider>(context,listen: false)
  //     .selectValuetypeinstall(int.parse(typeinstallController.toString()));
  // print(typeinstallController);

  // });

  noteController.text=_invoice!.notes.toString();
  imageController.text=_invoice!.imageRecord.toString();
  Provider.of<invoice_vm>(context,listen: false)
      .listinvoiceClient[widget.indexinvoice].products
      =_invoice!.products;

  Provider.of<invoice_vm>(context,listen: false)
      .listproductinvoic= _invoice!.products!;
}
else{
  /// add invoice
  Provider.of<invoice_vm>(context,listen: false)
      .listinvoiceClient.add(
      InvoiceModel(
        products: [],
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
    .listinvoiceClient.length>0) {
 index = Provider
      .of<invoice_vm>(context, listen: false)
      .listinvoiceClient
      .length-1 ;
}else index=0;
  widget.indexinvoice=index;//invoice is new
  Provider.of<invoice_vm>(context,listen: false)
      .listinvoiceClient[widget.indexinvoice].products=[];
  Provider.of<invoice_vm>(context,listen: false)
      .listproductinvoic= [];
}


     Provider.of<selected_button_provider>(context,listen: false)
         .selectValuetypepay(int.parse(typepayController!));
     print(typepayController);

     Provider.of<selected_button_provider>(context,listen: false)
         .selectValuetypeinstall(int.parse(typeinstallController.toString()));
     print(typeinstallController);
     super.initState();

   }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(

        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kWhiteColor),
          onPressed: () {
            // print("length ${Provider.of<invoice_vm>(context,listen: false)
            //     .listinvoiceClient.length}");
            // print("widget.indexinvoice  ${widget.indexinvoice}");
            //
            // print("in on pop addinvoice screen "
            //     +Provider.of<invoice_vm>(context,listen: false)
            //     .listinvoiceClient[widget.indexinvoice].idInvoice.toString());
            //
            // if(Provider.of<invoice_vm>(context,listen: false)
            //     .listinvoiceClient[widget.indexinvoice].idInvoice == null
            //     // ||
            //     // int.tryParse(Provider.of<invoice_vm>(context,listen: false)
            //     // .listinvoice[widget.indexinvoice].idInvoice.toString())!>0
            // ) {
            //  //clear cach invoice with it's product's
            //   Provider.of<invoice_vm>(context,listen: false)
            //       .listproductinvoic=[];
            //   Provider.of<invoice_vm>(context,listen: false)
            //       .listinvoiceClient[widget.indexinvoice].products=[];
            //   if(widget.indexinvoice==0)
            //   Provider.of<invoice_vm>(context,listen: false)
            //       .disposValue(-1);
            //   else{
            //     Provider.of<invoice_vm>(context,listen: false)
            //         .disposValue(widget.indexinvoice);
            //   }
            //
            //   widget.indexinvoice=
            //   widget.indexinvoice-1<=0?
            //   0:
            //   widget.indexinvoice-1;
            //   widget.indexinvoice
            //
            // } else {
            //   //
            //   // Provider.of<invoice_vm>(context,listen: false)
            //   //     .listproductinvoic=[];
            //   //
            //   // Provider.of<invoice_vm>(context,listen: false)
            //   //     .listinvoiceClient[widget.indexinvoice]
            //   //     .products=[];
            //   // Provider.of<invoice_vm>(context,listen: false)
            //   //     .listinvoiceClient.removeAt(widget.indexinvoice);
            //   // widget.indexinvoice=0;
            // }
            // ////
            //
            // Navigator.of(context).pop();
            // },
            Navigator.of(context).pop();},
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<LoadProvider>(context).isLoadingAddinvoice,
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              right: 20,
              left: 20,bottom: 10),
          child: ContainerShadows(
            width: double.infinity,
            //height: 400,
            margin: EdgeInsets.only(),
            child: Directionality(
              textDirection: myui.TextDirection.rtl,
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
                              color: Colors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.normal,
                              textstring:widget.indexinvoice>=0?
                              Provider.of<invoice_vm>(context,listen: true)
                                  .listinvoiceClient[widget.indexinvoice]
                                  .total.toString():"0",//totalController,
                              underline: TextDecoration.none,
                            ),
                            SizedBox(width: 10,),
                            ElevatedButton
                              (  //منتجات الفاتورة
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        kMainColor)),
                                onPressed: () {

                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute<void>(
                                  //     builder: (BuildContext context)
                                  //     => FullScreenDialog(),
                                  //     fullscreenDialog: true,
                                  //   ),
                                  // );

                                  Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                  builder: (context) =>
                                            add_invoiceProduct(
                                              invoice:
                                              Provider.of<invoice_vm>(context,listen: false)
                                                  .listinvoiceClient[widget.indexinvoice],
                                              indexinvoic:  widget.indexinvoice,
                                            ),
                                  ), (Route<dynamic> route) => true);
                                  // Navigator.push(context, MaterialPageRoute(
                                  //     builder: (context)=>
                                  //         add_invoiceProduct(
                                  //           invoice:
                                  //           Provider.of<invoice_vm>(context,listen: false)
                                  //               .listinvoiceClient[widget.indexinvoice],
                                  //           indexinvoic:  widget.indexinvoice,
                                  //         ), fullscreenDialog: true,
                                  // ));

                                },
                                child: Text("منتجات الفاتورة")),
                          ],
                        ),

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
                         child: Consumer<selected_button_provider>(
                           builder: (context, selectedProvider, child){
                           return  GroupButton(
                                 controller: GroupButtonController(
                                     selectedIndex:selectedProvider.isSelectedtypepay,
                                   //
                                   // typepayController==null
                                   //    ? 0
                                   //    :
                                   //int.tryParse( typepayController!)
                                 ),
                                 options: GroupButtonOptions(
                                     buttonWidth: 100,
                                     borderRadius: BorderRadius.circular(10)),
                                 buttons: ['نقدا','تحويل'],
                                 onSelected: (index,isselected){
                                   print(index);
                                   //setState(() {
                                     typepayController=index.toString();
                                     selectedProvider.selectValuetypepay(index);
                                   //});
                                 }
                             );
                           }

                         ),
                       ),
                        //manage
                        SizedBox(
                          height: 5,
                        ),
                        RowEdit(name: label_typeinstall, des: 'Required'),
                        Consumer<selected_button_provider>(
                          builder: (context, selectedProvider, child) {
                            return  GroupButton(
                                controller: GroupButtonController(
                                    selectedIndex:selectedProvider.isSelectedtypeinstall,
                                    // typeinstallController==null
                                    //     ? 0 :
                                    // int.tryParse( typeinstallController!)
                                ),
                                options: GroupButtonOptions(
                                    buttonWidth: 100,

                                    borderRadius: BorderRadius.circular(10)),
                                buttons: ['ميداني','اونلاين'],
                                onSelected: (index,isselected) {
                                  print(index);
                                  //setState(() {
                                    typeinstallController=index.toString();
                                    selectedProvider.selectValuetypeinstall(index);
                                  //  });
                                }
                            );
                          }

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

                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                    typepayController=
                                    Provider.of<selected_button_provider>(context,listen: false)
                                        .isSelectedtypepay.toString();

                                    typeinstallController=
                                    Provider.of<selected_button_provider>(context,listen: false)
                                        .isSelectedtypeinstall.toString();
                                    // if((_invoice!.products!=null&&_invoice!.products.isNotEmpty)
                                    //     ||(
                                    //print("widget.indexinvoice"+widget.indexinvoice.toString());
                                    if(  Provider.of<invoice_vm>(context,listen: false)
                                        .listinvoiceClient[widget.indexinvoice]
                                        .products!=null
                                        &&
                                        Provider.of<invoice_vm>(context,listen: false)
                                            .listinvoiceClient[widget.indexinvoice]
                                            .products!.isNotEmpty)

                                    {
                                      Provider.of<LoadProvider>(context, listen: false)
                                          .changebooladdinvoice(true);

                                      totalController= Provider.of<invoice_vm>(context,listen: false)
                                          .listinvoiceClient[widget.indexinvoice]
                                          .total.toString();

                                      _globalKey.currentState!.save();
                                      List<ProductsInvoice>? _products=[];
                                      // _invoice != null
                                      //     ? _invoice!.products
                                      //    :
                                      _products=   Provider
                                          .of<invoice_vm>(context, listen: false)
                                          .listinvoiceClient[widget.indexinvoice]
                                          .products;

                                      if (
                                      //_invoice!.idInvoice != null ||
                                      Provider
                                          .of<invoice_vm>(context, listen: false)
                                          .listinvoiceClient[widget.indexinvoice]
                                          .idInvoice != null) {

                                        String? invoiceID=
                                        // _invoice != null
                                        //     ? _invoice!.idInvoice
                                        //     :
                                        Provider
                                            .of<invoice_vm>(context, listen: false)
                                            .listinvoiceClient[widget.indexinvoice]
                                            .idInvoice;

                                        Provider.of<invoice_vm>(
                                            context, listen: false)
                                            .update_invoiceclient_vm({
                                          "name_enterprise":widget.itemClient.nameEnterprise,
                                          "name_client":widget.itemClient.nameClient,
                                          "nameUser":widget.itemClient.nameUser,
                                          "renew_year": renewController.text,
                                          "type_pay": typepayController,
                                          //"date_create": DateTime.now().toString(),
                                          "type_installation": typeinstallController,
                                          "amount_paid": amount_paidController.text,

                                          "fk_idClient": widget.idClient,
                                          "fk_idUser": widget.iduser,
                                          "image_record":imageController.text,

                                          "total": totalController,
                                          "notes": noteController.text,
                                          "id_invoice":invoiceID

                                          //"date_changetype":,
                                        },invoiceID
                                        ).then((value) =>
                                        value != false
                                            ? clear(context,invoiceID.toString(),_products)
                                            : error(context)
                                        );
                                      }
                                      else {
                                        Provider
                                            .of<invoice_vm>(context, listen: false)
                                            .listinvoiceClient
                                            .removeAt(widget.indexinvoice);
                                        widget.indexinvoice=widget.indexinvoice-1;
                                        print("******");
                                        Provider.of<invoice_vm>(
                                            context, listen: false)
                                            .add_invoiceclient_vm( {
                                          "name_enterprise":widget.itemClient.nameEnterprise,
                                          "name_client":widget.itemClient.nameClient,
                                          "nameUser":widget.itemClient.nameUser,
                                          "renew_year": renewController.text,
                                          "type_pay": typepayController,
                                          //"date_create":  formatter.format(_currentDate),
                                          "type_installation": typeinstallController,
                                          "amount_paid": amount_paidController.text,
                                          "image_record":imageController.text,
                                          "fk_idClient": widget.idClient,
                                          "fk_idUser": widget.iduser,//the same user that create a client not current user
                                          "total": totalController,
                                          "notes": noteController.text,
                                          'fk_regoin':widget.itemClient.fkRegoin,
                                          'fkcountry':widget.itemClient.fkcountry,
                                          //"date_changetype":,
                                          //'message':"",
                                        },
                                        ).then((value) =>
                                        value != "false"
                                            ?clear(context,value,_products)
                                            : error(context)
                                        );
                                      }
                                    }
                                    else {
                                      _scaffoldKey.currentState!.showSnackBar(
                                          SnackBar(content: Text('من فضلك ادخل منتجات'))
                                      );
                                    }

                                  }
                                },
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  clear(BuildContext context,String value,List<ProductsInvoice>? _products) async {
     //send notification
    //FCM.send
    // String message=  'لديك طلب موافقة على العميل (${widget.itemClient.nameEnterprise}) + \n موظف المبيعات ${widget.itemClient.nameUser} ';
    // //String message='+تم قبول رفع العميل${widget.itemClient.nameEnterprise}';موظف المبيعات محمد
    // Provider.of<notifyvm>(context,listen: false)
    //     .addNotification({
    //   'message':message,
    //   'from_user':widget.itemClient.nameUser,
    //   'to_user':'',//id user
    //   'type_notify':TypeNotify.Approve,
    //   'isread':'0',
    //   'data':widget.itemClient.idClients,
    // });
     print('in clear');
     widget.indexinvoice = 0;
     _products=   Provider
         .of<invoice_vm>(context, listen: false)
         .listinvoiceClient[widget.indexinvoice]
         .products;
     print('length '+_products!.length.toString());
    for(int i=0;i<_products.length;i++)
    {
      print('inside for');
      if(_products[i].idInvoiceProduct==null||_products[i].idInvoiceProduct=="null") {
        print('inside if');
        Map<String, dynamic?> body=_products[i].toJson();
        if(value!="")//update
        {

        }
        body.addAll({
          'fk_id_invoice':value,
        });
        // Provider
        //     .of<invoice_vm>(context, listen: false)
        //     .listproductinvoic.removeAt(i);

       String res=await Provider.of<invoice_vm>(context,listen: false)
            .add_invoiceProduct_vm(body);

        if (res!="false") {
          body.addAll({
            'idInvoiceProduct':res,
          });
          Provider
              .of<invoice_vm>(context, listen: false)
              .listproductinvoic[i].idInvoiceProduct=res;
      }
    }//if
    }//for loop
     Provider
         .of<invoice_vm>(context, listen: false)
         .listinvoiceClient[widget.indexinvoice].products= Provider
         .of<invoice_vm>(context, listen: false)
         .listproductinvoic;
      Provider
          .of<invoice_vm>(context, listen: false).updatelistproducetInvoice();

     Provider.of<LoadProvider>(context, listen: false)
         .changebooladdinvoice(false);
     _scaffoldKey.currentState!.showSnackBar(
         SnackBar(content: Text('تم الحفظ بنجاح'))
     );
  }

  error(context) {
   print("error method");
    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdinvoice(false);
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text('هناك خطأ ما'))
    );
  }
   DateTime _currentDate = DateTime.now();
   final DateFormat formatter = DateFormat('yyyy-MM-dd');
}
