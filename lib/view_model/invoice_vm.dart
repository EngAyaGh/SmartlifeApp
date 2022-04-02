

import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/services/Invoice_Service.dart';
import 'package:flutter/cupertino.dart';

class invoice_vm extends ChangeNotifier{

  List<InvoiceModel> listinvoice=[];
  List<DeletedinvoiceModel> listdeletedinvoice=[];
  List<ProductsInvoice> listproductinvoic=[];
  List<DeletedinvoiceModel> listdeleted=[];
  //List<>
  void addlistproductinvoic(value){
    listproductinvoic.add(value);
    notifyListeners();
  }
  void removelistproductinvoic(index){
    listproductinvoic.removeAt(index);
    notifyListeners();
  }
  void updatelistproducetInvoice(){

    notifyListeners();
  }
  void addlistinvoicedeleted(value){
    listdeleted.add(value);
    notifyListeners();
  }
  void removeinvoicedeleted(index){
    listdeleted.removeAt(index);
    notifyListeners();
  }

  Future<void> get_invoiceclient(String? fk_client) async {
    listinvoice = await Invoice_Service().getinvoicebyclient(fk_client!);
    notifyListeners();
  }
  Future<String> add_invoiceclient_vm(Map<String, dynamic?> body) async {
    //print('$body');
    String res = await Invoice_Service().addInvoice(body);
    if (res!="false") {
      body.addAll({
        'id_invoice':res,
        "products":listproductinvoic.map((e)=>e.toJson()).toList()
      });
      print('in add invoice vm');
      print('$body');
      listinvoice.insert(0, InvoiceModel.fromJson(body));
      print("////////////////////////////////////////////");
      print('${listinvoice[0].idInvoice}');
      //listinvoice[0].products=listproductinvoic;
      notifyListeners();
    }
    return res;
  }
  Future<String> add_invoiceProduct_vm(Map<String, dynamic?>? body) async {
    print('$body');
    String res = await Invoice_Service().addInvoiceProduct(body!);

    if (res!="false") {
      body.addAll({
        'idInvoiceProduct':res,
      });
      //listproductinvoic.insert(0, ProductsInvoice.fromJson(body));
      notifyListeners();
    }
    return res;
  }

  Future<bool> update_invoiceclient_vm(Map<String, dynamic?> body,String? idInvoice) async {
    bool res = await Invoice_Service().updateInvoice(body,idInvoice!);
    if (res) {
      final index=listinvoice.indexWhere((element) => element.idInvoice==idInvoice);
      body.addAll({
        "products":listproductinvoic.map((e)=>e.toJson()).toList()
      });
      listinvoice[index]=InvoiceModel.fromJson(body);
      //listProduct.insert(0, ProductModel.fromJson(body));
      notifyListeners();
    }
    //print(res.toString());
    return res;
  }
  Future<String> delete_invoice(String? id_invoice) async {

    String res = await Invoice_Service().deleteInvoiceById(id_invoice!);
    print("res in delete invoice "+res);
    //if(res=="done"){
      final index=listinvoice.indexWhere((element) => element.idInvoice==id_invoice);
      listinvoice.removeAt(index);
      notifyListeners();

    //}
    return res;
  }
  Future<String> deleteProductInInvoice(String? idInvoiceProduct) async {
    String res = await Invoice_Service().deleteProductInInvoice(idInvoiceProduct!);

    if(res=="done"){
      final index=listproductinvoic.indexWhere((element) => element.idInvoiceProduct==idInvoiceProduct);
      listproductinvoic.removeAt(index);
      notifyListeners();

    }
    return res;
  }
  Future<void> get_invoice_deleted(String? fk_regoin) async {
    listdeletedinvoice = await Invoice_Service().getinvoice_deleted(fk_regoin!);
    notifyListeners();
  }
  void disposValue(index){
    print("dispose "+index.toString());
    if(index!=-1)
    listinvoice.removeAt(index);
    else
     {

       listinvoice=[];
     }
    listproductinvoic=[];
    notifyListeners();
  }


}







