import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/ui/screen/product/editproduct.dart';

import 'package:crm_smart/view_model/product_vm.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class CardProduct extends StatelessWidget {
  CardProduct({required this.itemProd, this.scaffoldKey, Key? key})
      : super(key: key);
  ProductModel itemProd;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
    //     boxShadow: <BoxShadow>[
    //       BoxShadow(
    //         offset: Offset(1.0, 1.0),
    //         blurRadius: 8.0,
    //         color: Colors.black87.withOpacity(0.2),
    //       ),
    //     ],
    //     color: Colors.white30,
    //   ),
    //   child:
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 2, left: 2, bottom: 2),
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
            //height:80,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          itemProd.nameProduct.length > 45 ? Text('''
${itemProd.nameProduct.substring(0, 45)}
${itemProd.nameProduct.substring(45, itemProd.nameProduct.length)}
                          ''') : Text(itemProd.nameProduct),

                          // Text(
                          //   itemProd.nameProduct,
                          //    style: TextStyle(fontFamily: kfontfamily2),

                          // ),

                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'السعر  :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: kfontfamily2),
                              ),
                              Text(
                                itemProd.priceProduct,
                                style: TextStyle(fontFamily: kfontfamily2),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'الضريبة  :',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: kfontfamily2),
                                  ),
                                  Text(
                                    itemProd.value_config == null ||
                                            itemProd.value_config == "null"
                                        ? ' لا يوجد'
                                        : itemProd.value_config.toString(),
                                    style: TextStyle(fontFamily: kfontfamily2),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: kMainColor,
                              size: 18,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProduct(
                                            productModel: itemProd,
                                          )));
                            },
                            //onPressed: BOOKMARK,
                          ),
                          Positioned(
                            right: 20,
                            child: IconButton(
                              icon: Icon(
                                Icons.delete,
                                size: 18,
                              ),
                              onPressed: () async {
                                bool result = await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ModalProgressHUD(
                                      inAsyncCall:
                                          Provider.of<LoadProvider>(context)
                                              .isLoadingdelete,
                                      child: AlertDialog(
                                        title: Text('تأكيد'),
                                        content: Text('هل تريد الحذف'),
                                        actions: <Widget>[
                                          new TextButton(
                                            onPressed: () {
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop(
                                                      false); // dismisses only the dialog and returns false
                                            },
                                            child: Text('لا'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              Provider.of<LoadProvider>(context,
                                                      listen: false)
                                                  .changebooldelete(true);
                                              String res =
                                                  await Provider.of<product_vm>(
                                                          context,
                                                          listen: false)
                                                      .deleteProduct(
                                                          itemProd.idProduct);
                                              Provider.of<LoadProvider>(context,
                                                      listen: false)
                                                  .changebooldelete(false);
                                              print(res);
                                              if (res == "remove error")
                                                scaffoldKey!.currentState!
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "لا يمكن حذف هذا المنتج")));
                                              else {
                                                if (res == "done")
                                                  scaffoldKey!.currentState!
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              "تم الحذف بنجاح")));
                                                else if (res == 'bad requst')
                                                  scaffoldKey!.currentState!
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              "ارسال خاطئ")));
                                                else if (res == 'error')
                                                  scaffoldKey!.currentState!
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              " هناك مشكلة ما أثناء حذف المنتج")));
                                                else
                                                  scaffoldKey!.currentState!
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              "يوجد مشكلة ما ")));
                                              }

                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop(
                                                      true); // dismisses only the dialog and returns true
                                            },
                                            child: Text('نعم'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              //onPressed: COPY,
                            ),
                          )
                        ],
                      ),
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
