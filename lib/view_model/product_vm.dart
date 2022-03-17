


import 'dart:js';

import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/services/ProductService.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'country_vm.dart';

class product_vm extends ChangeNotifier{
  List<ProductModel> listProduct=[];

  Future<void> getproduct_vm(String fk) async {

    listProduct =await ProductService().getAllProduct(fk);

    notifyListeners();
  }
  Future<bool> addproduct_vm( Map<String,dynamic?> body) async {

    bool res=  await ProductService().addProduct(body);
if(res){
  listProduct.insert(0,ProductModel.fromJson(body));
  notifyListeners();

}
return res;
  }

}
