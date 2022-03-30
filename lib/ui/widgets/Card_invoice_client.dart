import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';
import 'package:crm_smart/ui/screen/product/editproduct.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class CardInvoiceClient extends StatelessWidget {
  CardInvoiceClient(
      {required this.itemProd, this.scaffoldKey,required this.indexinvoice, Key? key}) : super(key: key);
  InvoiceModel itemProd;
  int indexinvoice;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: InkWell(
          //splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail_Client()));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 8.0,
                  color: Colors.black87.withOpacity(0.2),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height:110,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(' اسم العميل',style:TextStyle(fontFamily: kfontfamily2),),
                                  Text(itemProd.nameClient.toString(),style:TextStyle(fontFamily: kfontfamily2),),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(' اسم المؤسسة',style:TextStyle(fontFamily: kfontfamily2),),
                                  Text(itemProd.name_enterprise.toString(),style:TextStyle(fontFamily: kfontfamily2),),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,

                                children: [
                                  Text(' تاريخ إنشاء الفاتورة',style:TextStyle(fontFamily: kfontfamily2),),
                                  Text(itemProd.dateCreate.toString(),style:TextStyle(fontFamily: kfontfamily2),),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,

                                children: [
                                  Text('المبلغ الإجمالي',style:TextStyle(fontFamily: kfontfamily2),),
                                  Text(itemProd.total.toString(),style:TextStyle(fontFamily: kfontfamily2),),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,

                                children: [
                                  Text('المبلغ المدفوع',style:TextStyle(fontFamily: kfontfamily2),),
                                  Text(itemProd.amountPaid.toString(),style:TextStyle(fontFamily: kfontfamily2),),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                children: [
                                  Text('التجديد السنوي',style:TextStyle(fontFamily: kfontfamily2),),

                                  Text(itemProd.renewYear.toString(),
                                    style:TextStyle(fontFamily: kfontfamily2),),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              new IconButton(
                                icon: Icon(Icons.edit, color: kMainColor,),
                                onPressed: () {
                                   Navigator.push(context, MaterialPageRoute(
                                       builder: (context)=>addinvoice(
                                         iduser:itemProd.fkIdUser ,
                                         idClient: itemProd.fkIdClient,
                                         invoice: itemProd,
                                         indexinvoice: indexinvoice
                                       )));
                                },
                                //onPressed: BOOKMARK,
                              ),
                              new IconButton(

                                icon: Icon(Icons.delete), onPressed: () async {

                               // if(itemProd.idInvoice!=null)

                                Provider.of<invoice_vm>(context,listen: false)
                                    .addlistinvoicedeleted(
                                    DeletedinvoiceModel(
                                        fkClient:itemProd.fkIdClient,
                                        fkUser:  itemProd.fkIdUser,
                                        dateDelete: DateTime.now().toString(),
                                        //city:itemProd.
                                      nameClient: itemProd.nameClient,
                                      nameUser: itemProd.nameUser,
                                )
                                );
                                Provider.of<invoice_vm>(context,listen: false)
                                    .delete_invoice(itemProd.idInvoice);
                              },
                                //onPressed: COPY,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        //  ),
      ),
    );
  }
}
