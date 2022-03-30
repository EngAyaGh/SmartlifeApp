

import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/services/Invoice_Service.dart';
import 'package:flutter/cupertino.dart';

class invoice_vm extends ChangeNotifier{

  List<InvoiceModel> listinvoice=[];
  List<DeletedinvoiceModel> listdeletedinvoice=[];
  List<ProductsInvoice> listproductinvoic=[];
  //List<>
  void addlist(value){
    listproductinvoic.add(value);
    notifyListeners();
  }
  void removelist(index){
    listproductinvoic.removeAt(index);
    notifyListeners();
  }

  Future<void> get_invoiceclient(String? fk_client) async {
    listinvoice = await Invoice_Service().getinvoicebyclient(fk_client!);
    notifyListeners();
  }
  Future<String> add_invoiceclient_vm(Map<String, dynamic?> body) async {
    String res = await Invoice_Service().addInvoice(body);
    if (res!="false") {
      body.addAll({
        'id_clients':res,

      });
      listinvoice.insert(0, InvoiceModel.fromJson(body));
      notifyListeners();
    }
    return res;
  }

  Future<bool> update_invoiceclient_vm(Map<String, dynamic?> body,String idInvoice) async {
    bool res = await Invoice_Service().updateInvoice(body,idInvoice);
    if (res) {
      final index=listinvoice.indexWhere((element) => element.idInvoice==idInvoice);
      listinvoice[index]=InvoiceModel.fromJson(body);
      //listProduct.insert(0, ProductModel.fromJson(body));
      notifyListeners();
    }
    return res;
  }
  Future<String> delete_invoice(String? id_invoice) async {
    String res = await Invoice_Service().deleteInvoiceById(id_invoice!);

    if(res=="done"){
      final index=listinvoice.indexWhere((element) => element.idInvoice==id_invoice);
      listinvoice.removeAt(index);
      notifyListeners();

    }
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
}







