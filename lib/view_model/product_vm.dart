


import 'dart:js';

import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/services/ProductService.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'country_vm.dart';

class product_vm extends ChangeNotifier{
  List<ProductModel> listProduct=[];

  Future<void> getproduct_vm(context) async {
    listProduct =await ProductService().getAllProduct("1");//Provider.of<country_vm>(context).id_country);
    notifyListeners();
  }
}
