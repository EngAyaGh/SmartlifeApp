

import 'package:crm_smart/Repository/invoice_repo/cach_data_source.dart';
import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/services/Invoice_Service.dart';
import 'package:flutter/cupertino.dart';



const CACHE_InvoiceClient_KEY = "CACHE_InvoiceClient_KEY";
const CACHE_InvoiceClient_INTERVAL = 60 * 1000; // 1 MINUTE IN MILLIS

const CACHE_Invoice_Deleted_KEY = "CACHE_Invoice_Deleted_KEY";
const CACHE_Invoice_Deleted_INTERVAL = 60 * 1000; // 30s in millis

class invoice_vm extends ChangeNotifier{
  invoice_vm(){
    //get_invoicesbyRegoin("");
  }
 // late cahe_data_source? localDataSource;
  // RemoteDataSource _remoteDataSource;
  // LocalDataSource _localDataSource;
  List<InvoiceModel> listinvoiceClient=[];
  List<DeletedinvoiceModel> listdeletedinvoice=[];
  List<ProductsInvoice> listproductinvoic=[];
  List<DeletedinvoiceModel> listdeleted=[];
  List<InvoiceModel> listinvoicebyregoin=[];
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

  Future<void> get_invoiceclient(String? fk_client
      ,List<InvoiceModel> list) async {

    int index=-1;

    list.forEach((element) {
      if( element.fkIdClient==fk_client)
      listinvoiceClient.add(element);
    });
    // if(index !=-1)
    //   listinvoiceClient=[];
    notifyListeners();
  }
  Future<void> get_invoicesbyRegoin(String? regoin) async {
    listinvoicebyregoin=[];
    cahe_data_source_invoice().clearCache();
    listinvoicebyregoin = await Invoice_Service().getinvoicebyregoin(regoin!);

    List<InvoiceModel>? val=await cahe_data_source_invoice()
        .getCache(CACHE_InvoiceClient_KEY, CACHE_InvoiceClient_INTERVAL)   ;
    if(listinvoicebyregoin.isEmpty)
    {
      print("inside get from api invoice");
      //listinvoicebyregoin=[];
      listinvoicebyregoin = await Invoice_Service().getinvoicebyregoin(regoin);
      if(listinvoicebyregoin!=null){
        //listinvoicebyregoin=[];
        await  cahe_data_source_invoice()
       .saveToCache(listinvoicebyregoin, CACHE_InvoiceClient_KEY);}
    }
    else {
      if(val!=null)// valid time
     {
       print("inside get from cache invoice");
       listinvoicebyregoin.addAll(val);
     }
    }
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
      listinvoiceClient.insert(0, InvoiceModel.fromJson(body));
      listinvoicebyregoin.add(InvoiceModel.fromJson(body));
      print("////////////////////////////////////////////");
      print('${listinvoiceClient[0].idInvoice}');
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
      final index=listinvoiceClient.indexWhere((element) => element.idInvoice==idInvoice);
      body.addAll({
        "products":listproductinvoic.map((e)=>e.toJson()).toList()
      });
      listinvoiceClient[index]=InvoiceModel.fromJson(body);
      //listProduct.insert(0, ProductModel.fromJson(body));
      notifyListeners();
    }
    //print(res.toString());
    return res;
  }
  Future<String> delete_invoice(String? id_invoice) async {

    int index=listinvoiceClient.indexWhere(
            (element) => element.idInvoice==id_invoice);
    listinvoiceClient.removeAt(index);
    String res = await Invoice_Service()
    .deleteInvoiceById(id_invoice!);
    print("res in delete invoice "+res);
    //if(res=="done"){
    index=listinvoicebyregoin.indexWhere(
            (element) => element.idInvoice==id_invoice);
    listinvoicebyregoin.removeAt(index);
      notifyListeners();
    //}
    return res;
  }
  Future<String> deleteProductInInvoice(String? idInvoiceProduct) async {
    String res = await Invoice_Service().deleteProductInInvoice(idInvoiceProduct!);

    if(res=="done"){
      int index=listproductinvoic
          .indexWhere((element) => element.idInvoiceProduct==idInvoiceProduct);
      listproductinvoic.removeAt(index);

      notifyListeners();

    }
    return res;
  }
  Future<void> get_invoice_deleted(String? fk_regoin) async {
    if(listdeletedinvoice.isEmpty)
    listdeletedinvoice = await Invoice_Service().getinvoice_deleted(fk_regoin!);
    notifyListeners();
  }
  void disposValue(index){
    print("dispose "+index.toString());
    if(index!=-1)
       listinvoiceClient.removeAt(index);
    else
     {
       listinvoiceClient=[];
     }
    listproductinvoic=[];
    notifyListeners();
  }


}







