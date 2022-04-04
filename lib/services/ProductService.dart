import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/productmodel.dart';

import '../constants.dart';

class ProductService{

  Future<String> addProduct( Map<String,dynamic?> body) async {
    print("$body");
try{
    String result = await Api()
        .post( url:url+"products/addProduct.php",
        body: body);
    return result !="error"? result:"false";}
    catch(e){
    return "false";
    }
  }
  //id_product
  Future<bool> updateProduct( Map<String,dynamic> body,String idproduct) async {
    String result = await Api()
        .post( url:url+"products/updateProduct.php?id_product=$idproduct",body:
    body
    );
    return result=="done"? true:false;
  }
  Future<List<ProductModel>> getAllProduct(String fk_country) async {
    List<dynamic> data =[];

    data=await Api().get(url:url+ 'products/getAllProduct.php?fk_country=$fk_country');

    List<ProductModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ProductModel.fromJson(data[i]));
    }
    print(prodlist);
    return prodlist;
  }
  Future<List<ProductModel>> getAllProductById(String idproduct) async {
    List<dynamic> data = await Api()
        .get(url:url+ 'products/getProductById.php?idproduct=$idproduct');

    List<ProductModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ProductModel.fromJson(data[i]));
    }
    return prodlist;
  }
  Future<String> deleteProductById(String idproduct) async {
   String res= await Api()
        .delete(url:url+ 'products/deleteProduct.php?fk_product=$idproduct'
   ,headers:{'Authorization': 'Bearer $token'};
   );
   return res;
  }
}