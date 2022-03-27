import 'dart:convert';
import 'dart:html';

import 'package:crm_smart/model/configmodel.dart';
import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/provider/config_vm.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/provider/switch_provider.dart';
import 'package:crm_smart/services/ProductService.dart';
import 'package:crm_smart/ui/widgets/custombutton.dart';
import 'package:crm_smart/ui/widgets/customformtext.dart';
import 'package:crm_smart/ui/widgets/group_button.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../labeltext.dart';

class addProduct extends StatefulWidget {
  addProduct({Key? key}) : super(key: key);

  @override
  _addProductState createState() => _addProductState();
}

class _addProductState extends State<addProduct> {
  bool valtaxrate = false;

  int valtype_product = 0;

  String nameprod = "";

  double price = 0;

  ProductModel? pd;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _globalKey = GlobalKey<FormState>();

  TextEditingController _textName = TextEditingController();

  TextEditingController _textprice = TextEditingController();

  late var taxrate;

  bool _isLoading = false;

  void settaxrate(context) {
    List<ConfigModel> _listconfg =
        Provider.of<config_vm>(context, listen: false).listofconfig;
    print("build 3");
    taxrate =
        _listconfg.firstWhere((element) => element.name_config == 'taxrate');
  }

  @override
  Widget build(BuildContext context) {
    String idCountry = Provider.of<country_vm>(context).id_country;
    print("build add prod");
    print(idCountry);
    Provider.of<config_vm>(context, listen: false).getAllConfig(idCountry);
    print("build 2");

    return Scaffold(
      backgroundColor: Colors.white30,
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kWhiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        //title: Text('إضافة منتج',textAlign: TextAlign.center,style: TextStyle(color: kWhiteColor),),
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<LoadProvider>(context).isLoadingAddProd,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(45),
            child: Form(
              key: _globalKey,
              child: Column(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Consumer<selected_button_provider>(
                      builder: (context, selectedProvider, child) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: ButtonGroup(
                          color: kMainColor,

                          //secondaryColor: Colors.white,
                          titles: ["برامج", "أجهزة"], //[0,1]
                          current: selectedProvider.isSelected,

                          onTab: (selected) {
                            valtype_product = selected;
                            valtype_product == 0 ? 1 : 0;
                            selectedProvider.selectValue(selected);
                          },
                        ),
                      ),
                    );
                  }),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 70),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //   height: 20,
                          // ),
                          Container(
                            width: 300,
                            child: CustomFormField(
                              radius: 15,
                              maxline: 1,
                              vaild: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a  name of product ';
                                }
                              },
                              con: _textName,
                              label: label_name_product,
                              onChanged: (val) {
                                nameprod = val;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 300,
                            child: CustomFormField(
                              radius: 15,
                              vaild: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a  price ';
                                }
                                if (double.tryParse(value) == null) {
                                  return 'Please Enter a Valid Number';
                                }
                                if (double.parse(value) <= 0) {
                                  return 'Please Enter the number greather no than zero';
                                }
                              },
                              con: _textprice,
                              inputType: TextInputType.number,
                              label: label_name_price,
                              onChanged: (val) {
                                price = double.parse(val.toString());
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Consumer<switch_provider>(
                              builder: (context, isSwitched, child) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      label_turnVat,
                                      style: TextStyle(
                                        color: Colors.black26,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Switch(
                                        activeTrackColor:
                                            kMainColor.withAlpha(90),
                                        activeColor: kMainColor,
                                        value: isSwitched.isSwitched,
                                        onChanged: (value) {
                                          valtaxrate = value;
                                          isSwitched.changeboolValue(value);
                                        }),
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          _isLoading
                              ? CircularProgressIndicator()
                              : CustomButton(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  text: label_button_addProduct,
                                  onTap: () async {
                                    if (_globalKey.currentState!.validate()) {
                                      _globalKey.currentState!.save();
                                      Provider.of<LoadProvider>(context,
                                              listen: false)
                                          .changeboolValueisLoading(true);

                                      settaxrate(context);
                                      Provider.of<product_vm>(context,
                                              listen: false)
                                          .addproduct_vm({
                                        'nameProduct': nameprod,
                                        'priceProduct': price.toString(),
                                        'type': valtype_product.toString(),
                                        'fk_country': idCountry,
                                        'fk_config': valtaxrate
                                            ? taxrate.id_config
                                            : "null" //
                                      }).then((value) => value
                                                  ? clear(context)
                                                  : error()
                                              // Fluttertoast.showToast(
                                              //  backgroundColor:
                                              //      Colors.lightBlueAccent,
                                              //  msg: label_errorAddProd, // message
                                              //  toastLength:
                                              //      Toast.LENGTH_SHORT, // length
                                              //  gravity: ToastGravity.CENTER, //
                                              );
                                    }
                                  },
                                )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void error() {
    Provider.of<LoadProvider>(context, listen: false)
        .changeboolValueisLoading(false);
    _scaffoldKey.currentState!
        .showSnackBar(SnackBar(content: Text(label_errorAddProd)));
  }

  void clear(context) {
    Provider.of<LoadProvider>(context, listen: false)
        .changeboolValueisLoading(false);

    _textName.text = "";
    _textprice.text = "";
    Provider.of<switch_provider>(context, listen: false).changeboolValue(false);
    _scaffoldKey.currentState!
        .showSnackBar(SnackBar(content: Text(label_doneAddProduct)));
    // Fluttertoast.showToast(
    //   backgroundColor: Colors.lightBlueAccent,
    //
    //   msg: label_doneAddProduct, // message
    //   toastLength: Toast.LENGTH_SHORT, // length
    //   gravity: ToastGravity.BOTTOM_LEFT, //
    // );
  }
}
