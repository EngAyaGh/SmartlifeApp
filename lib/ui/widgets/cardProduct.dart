import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/ui/screen/product/editproduct.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class CardProduct extends StatelessWidget {
   CardProduct( {required this.itemProd, Key? key}) : super(key: key);
  ProductModel itemProd;
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
                                    Text(itemProd.value_config==null?'no taxrate':itemProd.value_config.toString(),
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
                                  icon: Icon(Icons.delete), onPressed: () {  },
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
