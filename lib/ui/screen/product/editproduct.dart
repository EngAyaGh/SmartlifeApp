


import 'package:crm_smart/model/configmodel.dart';
import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/provider/config_vm.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/provider/switch_provider.dart';
import 'package:crm_smart/ui/widgets/custombutton.dart';
import 'package:crm_smart/ui/widgets/customformtext.dart';
import 'package:crm_smart/ui/widgets/group_button.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../labeltext.dart';

class EditProduct extends StatefulWidget {
   EditProduct({Key? key,required this.productModel}) : super(key: key);

  ProductModel productModel;

   @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _globalKey = GlobalKey<FormState>();
  TextEditingController _textName = TextEditingController();

  TextEditingController _textprice = TextEditingController();
  int valtype_product = 0;
  bool valtaxrate = false;

  late var taxrate;
  bool _isLoading = false;
  String nameprod = "";
  double price = 0;

  @override
  void initState()  {

    nameprod= _textName.text=widget.productModel.nameProduct;
    _textprice.text=widget.productModel.priceProduct;
    price=double.parse(_textprice.text.toString());
    valtype_product=int.parse( widget.productModel.type);
    valtype_product == 0 ? 1 : 0;
    print(widget.productModel.fkConfig);
    valtaxrate=widget.productModel.fkConfig==null?false:true;
    print(valtaxrate);

    Provider.of<selected_button_provider>(context,listen: false).selectValue(valtype_product);

    Provider.of<switch_provider>(context,listen: false).changeboolValue(valtaxrate);

    super.initState();

  }
   void settaxrate(context) {
    List<ConfigModel> _listconfg =
        Provider.of<config_vm>(context, listen: false).listofconfig;
    print("build 3");
    taxrate =
        _listconfg.firstWhere((element) => element.name_config == 'taxrate');
    print(taxrate);

  }
  @override
  Widget build(BuildContext context) {
    String idCountry = Provider.of<country_vm>(context).id_country;
    print("build add prod");
    print(idCountry);
    Provider.of<config_vm>(context, listen: false).getAllConfig(idCountry);
    // Provider.of<LoadProvider>(context, listen: false)
    //     .changeLoadingupdateprod(false);


    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kWhiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        //title: Text('إضافة منتج',textAlign: TextAlign.center,style: TextStyle(color: kWhiteColor),),
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<LoadProvider>(context).isLoadingupdateprod,
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
                        return Center(
                          child: ButtonGroup(
                              color: kMainColor,
                              //secondaryColor: Colors.white,
                              titles: ["برامج", "أجهزة"], //[0,1]
                              current: selectedProvider.isSelected,
                              onTab: (selected) {
                                valtype_product = selected;
                                valtype_product == 0 ? 1 : 0;
                                selectedProvider.selectValue(selected);
                              }),
                        );
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    radius: 15,
                    maxline: 3,
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
                  SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
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
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Consumer<switch_provider>(
                      //on off tax
                      builder: (context, isSwitched, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(label_turnVat),
                            Switch(
                                activeTrackColor: kMainColor.withAlpha(90),
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
                    width: MediaQuery.of(context).size.width * 0.2,
                    text: "تعديل",
                    onTap: () async {
                      if (_globalKey.currentState!.validate()) {
                        _globalKey.currentState!.save();
                        Provider.of<LoadProvider>(context, listen: false)
                            .changeLoadingupdateprod(true);

                        settaxrate(context);
                        print(valtype_product);
                        Provider.of<product_vm>(context, listen: false)
                            .updateproduct_vm(
                           {
                          'nameProduct': nameprod,
                          'priceProduct': price.toString(),
                          'type': valtype_product.toString(),
                           'fk_country':idCountry,
                          'fk_config':
                          valtaxrate ? taxrate.id_config : "null" //
                        },widget.productModel.idProduct.toString())
                            .then((value) => value
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
        ),
      ),
    );
  }
  clear(body) {
    //label_Edituser
    Provider.of<LoadProvider>(context, listen: false)
        .changeLoadingupdateprod(false);
    final index=
    Provider.of<switch_provider>(context, listen: false).changeboolValue(false);

    // controllerUsers.usersList.indexWhere((element) =>
    // element.idUser==widget.userModel.idUser);
    // controllerUsers.usersList[index] = UserModel.fromJson( body);

    _textName.text = "";
    _textprice.text = "";

    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text(label_Edituser))
    );
  }

  error() {
    Provider.of<LoadProvider>(context, listen: false)
        .changeLoadingupdateprod(false);
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text(label_errorAddProd)));
  }
}
