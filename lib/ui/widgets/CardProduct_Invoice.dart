import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/productmodel.dart';

import 'package:crm_smart/ui/screen/product/editproduct.dart';
import 'package:crm_smart/ui/widgets/text_form.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class CardProduct_invoice extends StatelessWidget {
  CardProduct_invoice({
    required this.itemProd,index,
    required this.iduser,
    required this.idclient, Key? key}) : super(key: key);
  ProductsInvoice itemProd;
  int index=0;
  String? idclient,iduser;
  @override
  Widget build(BuildContext context) {
    double totaltax = 0;

    if (itemProd.rateAdmin.toString() != '' &&
        itemProd.rateUser.toString() != '')
  {

    totaltax= double.tryParse(itemProd.rateAdmin.toString())!+
        double.parse(itemProd.rateUser.toString());
  }else{
      if (itemProd.rateAdmin.toString() != '')
      totaltax=double.tryParse(itemProd.rateAdmin.toString())!;
      if (itemProd.rateUser.toString() != '')
      totaltax=double.tryParse(itemProd.rateUser.toString())!;
    }


    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        // child: InkWell(
        //   //splashColor: Colors.blue.withAlpha(30),
        //   onTap: () {
        //     //Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail_Client()));
        //   },
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
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            height: 120,
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
                          //this column --> information
                          Container(
                            margin: EdgeInsets.only(
                              right: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      ' اسم المنتج : ',
                                      style:
                                      TextStyle(fontFamily: kfontfamily2),
                                    ),
                                    Text(
                                      itemProd.nameProduct.toString(),
                                      style:
                                      TextStyle(fontFamily: kfontfamily2),
                                    ),
                                  ],
                                ),
                                Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      ' السعر : ',
                                      style:
                                      TextStyle(fontFamily: kfontfamily2),
                                    ),
                                    Text(
                                      itemProd.price.toString(),
                                      style:
                                      TextStyle(fontFamily: kfontfamily2),
                                    ),
                                  ],
                                ),
                                Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      ' الكمية : ',
                                      style:
                                      TextStyle(fontFamily: kfontfamily2),
                                    ),
                                    Text(
                                      itemProd.amount.toString(),
                                      style:
                                      TextStyle(fontFamily: kfontfamily2),
                                    ),
                                  ],
                                ),
                                Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      ' قيمة الحسم : ',
                                      style:
                                      TextStyle(fontFamily: kfontfamily2),
                                    ),
                                    Text(

                                          totaltax.toString(),
                                      style:
                                      TextStyle(fontFamily: kfontfamily2),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          //this Row --> for icon
                          Row(
                            children: [
                              new IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: kMainColor,
                                ),
                                onPressed: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => EditProduct(
                                  //           productModel: itemProd,
                                  //         )));
                                },
                                //onPressed: BOOKMARK,
                              ),
                              new IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: kMainColor,
                                  ),
                                  onPressed: () => {

                                    if(itemProd.idInvoiceProduct!=null)
                                      {
                                        // Provider.of<invoice_vm>(context,listen: false)
                                        //     .listproductinvoic[index].isdeleted=true,

                                        Provider.of<invoice_vm>(context,listen: false)
                                            .removelistproductinvoic(index),
                                        Provider.of<invoice_vm>(
                                            context, listen: false)
                                            .deleteProductInInvoice(
                                            itemProd.idInvoiceProduct)
                                      }
                                    else
                                      {

                                        Provider.of<invoice_vm>(context,listen: false)
                                          .removelistproductinvoic(index)

                                      }
                                  }

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
      );

  }
}