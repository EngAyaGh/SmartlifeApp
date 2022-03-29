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

class addinvoice extends StatelessWidget {
   addinvoice({required this.iduser,required this.idClient, Key? key}) : super(key: key);
   String idClient,iduser;
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
   final _globalKey = GlobalKey<FormState>();

   final TextEditingController totalController = TextEditingController();

   final TextEditingController amount_paidController = TextEditingController();

   final TextEditingController renewController = TextEditingController();
   late final String? typepayController ;
    String? typeinstallController;
   final TextEditingController noteController = TextEditingController();
   final TextEditingController imageController = TextEditingController();

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

                     controller: GroupButtonController(selectedIndex: 0),
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
                      controller: GroupButtonController(selectedIndex: 0),
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
                        textstring: '00000',
                        underline: TextDecoration.none,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: TextButton(
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
                      child: Text(label_addinvoice ,style: TextStyle(color: Colors.white),),
                      onPressed: () async {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>add_invoiceProduct()
                        ));


                        if (_globalKey.currentState!.validate()) {
                          _globalKey.currentState!.save();

                          Provider.of<invoice_vm>(context,listen: false)
                              .add_invoiceclient_vm( {

                            'renewYear': renewController.text,
                            'typePay':typepayController==null,
                            //"date_create": ,
                            "typeInstallation":typeinstallController,
                            "amountPaid":amount_paidController.text,

                            "fkIdClient":idClient,
                            "fkIdUser":iduser,

                            "total":totalController.text,
                            "notes":noteController.text,
                            //"date_changetype":,
                          },

                          ).then((value) => value!="false"
                              ? clear(context)
                              : error()

                          );

                        }
                      },
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
