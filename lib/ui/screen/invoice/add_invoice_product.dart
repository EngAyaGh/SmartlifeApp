import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/ui/widgets/CardProduct_Invoice.dart';
import 'package:crm_smart/ui/widgets/cardProduct.dart';
import 'package:crm_smart/ui/widgets/customformtext.dart';
import 'package:crm_smart/ui/widgets/regoincombox.dart';
import 'package:crm_smart/ui/widgets/row_edit.dart';
import 'package:crm_smart/ui/widgets/text_form.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
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
  List<ProductModel> listProduct = [];
  List<ProductsInvoice> listAdded = [];
  String? selectedvalue = null;
  TextEditingController _taxuser = TextEditingController();
  late String _taxuser_value;

  TextEditingController _textprice = TextEditingController();

  TextEditingController _taxadmin = TextEditingController();
  late String _taxadmin_value;
  TextEditingController _amount= TextEditingController();
  late String _amount_value;
  late int index=0;
  @override
  void initState() {
    _taxuser.text='';_taxuser_value='';
    _taxadmin.text='';_taxadmin_value='';
    _textprice.text='0';
    _amount.text='1';_amount_value='1';
    String id_country =
        Provider.of<country_vm>(context, listen: false).id_country;
        Provider.of<product_vm>(context, listen: false)
        .getproduct_vm(id_country);

    //.then((value) => _isLoading=false);
    super.initState();
  }
void calculate(){
    setState(() {
      double totaltax=0;
      _textprice.text=listProduct[index].priceProduct;
      String? taxCountry=listProduct[index].value_config;
      print(taxCountry);
      if(taxCountry!=null)
        {
          double pricewithtax=double.parse(_textprice.text)* double.parse(taxCountry)/100;
          print(pricewithtax);
          _textprice.text =(double.parse(_textprice.text) +pricewithtax).toString();
        }
          if(_taxadmin.text!=''&&_taxuser.text!='')
          {
            totaltax = double.parse(_taxadmin.text)+double.parse( _taxuser.text);
            //_textprice.text=totaltax.toString();
          }
          else {
            print('inside else '+_taxadmin.text);
            print('inside else '+_taxuser.text);
            if(_taxadmin.text!='')
              totaltax=double.parse(_taxadmin.text);
            if(_taxuser.text!='')
              totaltax=double.parse( _taxuser.text);
          }
          double pricewithouttax=double.parse(_textprice.text)* totaltax/100;
          _textprice.text =(double.parse(_textprice.text)-pricewithouttax).toString();
          print( _textprice.text);
          double totalprice=double.parse(_textprice.text)
              *double.parse( _amount.text);
          _textprice.text=totalprice.toString();
        }

    );

}
  @override
  Widget build(BuildContext context) {
    listProduct = Provider.of<product_vm>(context, listen: true).listProduct;

    return Scaffold(
      body: Container(
        child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height:MediaQuery.of(context).size.height*0.37,
              child: Column(
              children: [
                Container(
                  child: DropdownButton(
                    isExpanded: true,
                    hint: Text("اختر منتج"),
                    items: listProduct.map((level_one) {
                      return DropdownMenuItem(
                        child: Text(level_one.nameProduct), //label of item
                        value: level_one.idProduct, //value of item
                      );
                    }).toList(),
                    value:
                        selectedvalue, //select_dataItem!.idCountry ,
                    onChanged: (value) {
                      setState(() {
                        selectedvalue = value.toString();
                       index=listProduct.indexWhere(
                                (element) => element.idProduct==selectedvalue);
                        calculate();
                      });
                      //Provider.of<regoin_vm>(context,listen: false).changeVal(value.toString());
                    },
                  ),
                ),
                SizedBox(height: 5,),

                Row(
                  children: [
                    Flexible(
                      child: CustomFormField(
                        onChanged: (val) {
                          _taxadmin_value=val;
                         calculate();
                        },
                          inputType: TextInputType.number,

                          read: false,con: _taxadmin,
                          label: 'نسبة الخصم المتاحة للمشرف', radius: 20),
                    ),

                    SizedBox(width: 70,),
                    Text('%'),
                    //TextBox.fromLTRBD(20, 20, 20, 20,TextDirection.rtl),
                  ],
                ),
                SizedBox(height: 5,),

                Row(
                  children: [
                    Flexible(
                      child: CustomFormField(
                        read: false,
                          onChanged: (val) {
                            _taxuser_value=val;
                            calculate();
                          },
                          inputType: TextInputType.number,

                          con: _taxuser,
                          label: 'نسبة الخصم المتاحة للموظف', radius: 20),
                    ),
                    SizedBox(width: 70,),
                    Text('%'),
                    //   //TextBox.fromLTRBD(20, 20, 20, 20,TextDirection.rtl),
                  ],
                ),
                SizedBox(height: 5,),

                Row(
                  children: [
                    Flexible(child: CustomFormField(
                      read: false,
                      onChanged: (val) {
                        print(val);
                        if(val==null)_amount_value='1';
                        _amount_value=val;
                        calculate();
                      },
                      inputType: TextInputType.number,
                      label: 'الكمية', radius: 20,con: _amount,)),
                    SizedBox(height: 5,),

                    Flexible(child: CustomFormField(
                        ontap: calculate,
                        read: true,
                        con: _textprice,
                        label: 'السعر', radius: 20)),

                  ],
                ),

                SizedBox(height: 5,),

                ElevatedButton
                  (style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        kMainColor)),
                    onPressed: () {
                      //iduser
                      final index=listProduct.indexWhere((element) => element.idProduct==selectedvalue);
                      ProductModel pm=listProduct[index];
                      ProductsInvoice  pp=ProductsInvoice(
                        fkProduct:pm.idProduct,
                        fkConfig: pm.fkConfig,
                        fkCountry: pm.fkCountry,
                        price: _textprice.text,
                        amount: _amount.text,
                        rateAdmin: _taxadmin.text,
                        rateUser: _taxuser.text,
                        nameProduct: pm.nameProduct
                      );
                      listAdded.add(pp);
                      Provider.of<invoice_vm>(context,listen: false).addlist(pp);
                    },
                    child: Text('إضافة')),
              ],
              ),
            ),
          ),
          Container(
            // height:  MediaQuery.of(context).size.height/2,
            child:
            Column(
              children: [
                Text('منتجات الفاتورة'),
                Padding(
                  padding: const EdgeInsets.only(left:20,right: 20,top: 10,bottom: 10),
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height *0.7,
                    child:
                    Consumer<invoice_vm>(
                      builder: (_, data, __) =>
                          Expanded(
                          child: ListView.builder(
                            itemCount: data.listproductinvoic.length,
                            itemBuilder: (context, index) {
                              return CardProduct_invoice(itemProd: data.listproductinvoic[index]);
                            },),
                  ),
                ),
                  ),),
              ],
            ),
          ),
        ],
          ),
      ),
    );
  }
}
