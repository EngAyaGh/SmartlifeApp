
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/services/ProductService.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'country_vm.dart';

class product_vm extends ChangeNotifier {
  List<ProductModel> listProduct = [];




  Future<void> getproduct_vm(String fk) async {
    //if(listProduct.isEmpty)
    //listProduct=[];
    // listProduct.clear();
    // notifyListeners();
    listProduct = await ProductService().getAllProduct(fk);

    notifyListeners();
  }

  Future<String> addproduct_vm(Map<String, dynamic?> body) async {
    String res = await ProductService().addProduct(body);
    if (res!="false") {
      body.addAll({'id_product':res});
      listProduct.insert(0, ProductModel.fromJson(body));
      notifyListeners();
    }
    return res;
  }
  Future<bool> updateproduct_vm(Map<String, dynamic?> body,String id_product) async {
    bool res = await ProductService().updateProduct(body,id_product);
    if (res) {
      final index=listProduct.indexWhere((element) => element.idProduct==id_product);
      listProduct[index]=ProductModel.fromJson(body);
      //listProduct.insert(0, ProductModel.fromJson(body));
      notifyListeners();
    }
    return res;
  }
  Future<String> deleteProduct(String? id_product) async {
    //listProduct=[];
    String res = await ProductService().deleteProductById(id_product!);
    print(res);
      if(res=="done"){
        final index=listProduct.indexWhere((element) => element.idProduct==id_product);
        listProduct.removeAt(index);
        notifyListeners();

    }
    return res;
    }

  }









