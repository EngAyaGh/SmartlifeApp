

import 'dart:convert';

import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';

import '../constants.dart';

class Invoice_Service {


  Future<List<InvoiceModel>> getinvoicebyclient(String fk_idClient) async {
    var
    data=await Api()
        .get(url:url+ 'client/invoice/get_invoice_ByIdClient.php?fk_idClient=$fk_idClient');
    print(data);
    List<InvoiceModel> prodlist = [];
    // final json = "[" + data[i] + "]";
    for (int i = 0; i < data.length; i++) {
      print(i);

      //print("data "+ "[" + data[i] + "]");
      prodlist.add(InvoiceModel.fromJson(data[i]));
    }
    print(prodlist);
    return prodlist;
  }
  Future<String> addInvoice( Map<String,dynamic?> body) async {
    print("$body");
    try{
      String result = await Api()
          .post( url:url+"client/invoice/addinvoice.php",
          body: body);
      print(result);
      return result !="error"? result:"false";
    }
    catch(e) {
      print(e);
      return "false";
    }
  }
  Future<String> addInvoiceProduct( Map<String,dynamic?> body) async {
    print("$body");
    try{
      String result = await Api()
          .post( url:url+"client/invoice/addinvoice_product.php",
          body: body);
      print(result);
      return result !="error"? result:"false";}
    catch(e){
      print(e);
      return "false";
    }
  }
  Future<bool> updateInvoice( Map<String,dynamic> body,String idInvoice) async {
    String result = await Api()
        .post( url:url+"client/invoice/updateinvoice.php",body:
    body
    );
    return result=="done"? true:false;
  }
  Future<String> deleteInvoiceById(String? id_invoice) async {
    print("id_invoice "+id_invoice!);

   String res= await Api()
        .post(url:url+ 'client/invoice/deleteinvoice.php?id_invoice=$id_invoice');
   print("delete in services "+res);
   return res;
  }
  Future<String> deleteProductInInvoice(String id_invoice_product) async {
    String res= await Api()
        .get(url:url+ 'client/invoice/deleteinvoice_product.php?id_invoice_product=$id_invoice_product');
    return res;
  }

  Future<List<DeletedinvoiceModel>> getinvoice_deleted(String fk_regoin) async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'client/invoice/get_invoice_deleted.php?fk_regoin=$fk_regoin');

    List<DeletedinvoiceModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(DeletedinvoiceModel.fromJson(data[i]));
    }
    print(prodlist);
    return prodlist;
  }
}