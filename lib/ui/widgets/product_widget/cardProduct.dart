import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/ui/screen/product/editproduct.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class CardProduct extends StatelessWidget {
   CardProduct( {required this.itemProd, this.scaffoldKey, Key? key}) : super(key: key);
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
                                    Text(' اسم المنتج',style:TextStyle(fontFamily: kfontfamily2),),
                                    Text(itemProd.nameProduct,style:TextStyle(fontFamily: kfontfamily2),),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                                  children: [
                                    Text(' السعر',style:TextStyle(fontFamily: kfontfamily2),),
                                    Text(itemProd.priceProduct,style:TextStyle(fontFamily: kfontfamily2),),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                  children: [
                                    Text(' قيمة الضريبة',style:TextStyle(fontFamily: kfontfamily2),),

                                    Text(itemProd.value_config==null||itemProd.value_config=="null"?'no taxrate':itemProd.value_config.toString(),
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
                                        builder: (context)=>EditProduct(productModel: itemProd,)));

                                },
                                  //onPressed: BOOKMARK,
                                ),
                                new IconButton(

                                  icon: Icon(Icons.delete), onPressed: () async {
                                  bool result = await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ModalProgressHUD(
                                        inAsyncCall: Provider.of<LoadProvider>(context)
                                            .isLoadingdelete,

                                        child: AlertDialog(
                                          title: Text('تأكيد'),
                                          content: Text('هل تريد الحذف'),
                                          actions: <Widget>[
                                            new FlatButton(
                                              onPressed: () {
                                                Navigator.of(context, rootNavigator: true)
                                                    .pop(false); // dismisses only the dialog and returns false
                                              },
                                              child: Text('لا'),
                                            ),
                                            FlatButton(
                                              onPressed: ()async {
                                                Provider.of<LoadProvider>(context,listen: false)
                                                    .changebooldelete(true);
                                                String res =await Provider.of<product_vm>(context,listen: false)
                                                    .deleteProduct(itemProd.idProduct);
                                                Provider.of<LoadProvider>(context,listen: false)
                                                    .changebooldelete(false);
                                                if(res=="remove error")
                                                  scaffoldKey!.currentState!.showSnackBar(
                                                      SnackBar(content: Text("لا يمكن حذف هذا المنتج"))
                                                  );
                                                else{
                                                  if(res!='error')
                                                    scaffoldKey!.currentState!.showSnackBar(
                                                        SnackBar(content: Text("تم الحذف بنجاح"))
                                                    );
                                                }

                                                Navigator.of(context, rootNavigator: true)
                                                    .pop(true); // dismisses only the dialog and returns true
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
