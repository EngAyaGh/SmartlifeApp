import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/ui/widgets/customformtext.dart';
import 'package:crm_smart/ui/widgets/regoincombox.dart';
import 'package:crm_smart/ui/widgets/row_edit.dart';
import 'package:crm_smart/ui/widgets/text_form.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class add_invoiceProduct extends StatefulWidget {
  add_invoiceProduct({Key? key}) : super(key: key);

  @override
  _add_invoiceProductState createState() => _add_invoiceProductState();
}

class _add_invoiceProductState extends State<add_invoiceProduct> {
  List<ProductModel> prodlist = [];
  String? selectedvalue = null;
  TextEditingController _taxuser = TextEditingController();
  TextEditingController _textprice = TextEditingController();
  TextEditingController _taxadmin = TextEditingController();
  @override
  void initState() {
    // String id_country =
    //     Provider.of<country_vm>(context, listen: false).id_country;
    // Provider.of<product_vm>(context, listen: false)
    //     .getproduct_vm(id_country); //.then((value) => _isLoading=false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //prodlist = Provider.of<product_vm>(context, listen: true).listProduct;
    return Container(
      child: Row(
        children: [
          Column(
          children: [
            Expanded(
              child: Container(
                height:MediaQuery.of(context).size.height/2,
                child: Column(
                children: [
                  // Container(
                  //   child: DropdownButton(
                  //     isExpanded: true,
                  //     hint: Text("اختر منتج"),
                  //     items: prodlist.map((level_one) {
                  //       return DropdownMenuItem(
                  //         child: Text(level_one.nameProduct), //label of item
                  //         value: level_one.idProduct, //value of item
                  //       );
                  //     }).toList(),
                  //     value:
                  //         selectedvalue, //select_dataItem!.idCountry ,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         selectedvalue = value.toString();
                  //       });
                  //       //Provider.of<regoin_vm>(context,listen: false).changeVal(value.toString());
                  //     },
                  //   ),
                  // ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: CustomFormField(
                                label: 'الضريبة المتاحة للمشرف', radius: 20),
                          ),
                          SizedBox(width: 70,),
                          Text('%'),
                          //TextBox.fromLTRBD(20, 20, 20, 20,TextDirection.rtl),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: CustomFormField(
                                label: 'الضريبة المتاحة للموظف', radius: 20),
                          ),
                          SizedBox(width: 70,),
                          Text('%'),
                          //   //TextBox.fromLTRBD(20, 20, 20, 20,TextDirection.rtl),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(child: CustomFormField(label: 'الكمية', radius: 20)),
                          SizedBox(height: 5,),

                          Flexible(child: CustomFormField(label: 'السعر', radius: 20)),

                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 5,),

                  ElevatedButton
                    (style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          kMainColor)),
                      onPressed: () {
                        //iduser

                      },
                      child: Text('إضافة')),
                ],
                ),
              ),
            ),
            Expanded(
              child:Container(
                  height:  MediaQuery.of(context).size.height/2,
                child: Column(
                  children: [
                    Text('منتجات الفاتورة'),
                    //ListView(),
                  ],
                ),
              ),),
          ],
        ),
      ],),
    );
  }
}
