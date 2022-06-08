

import 'package:crm_smart/Repository/invoice_repo/cach_data_source.dart';
import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/Invoice_Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'dart:io';


const CACHE_InvoiceClient_KEY = "CACHE_InvoiceClient_KEY";
const CACHE_InvoiceClient_INTERVAL = 60 * 1000; // 1 MINUTE IN MILLIS

const CACHE_Invoice_Deleted_KEY = "CACHE_Invoice_Deleted_KEY";
const CACHE_Invoice_Deleted_INTERVAL = 60 * 1000; // 30s in millis

class invoice_vm extends ChangeNotifier{
  String total='0';

  void set_total(val){
    total=val;
    notifyListeners();
  }
  bool isloading=false;
  UserModel? usercurrent;
  invoice_vm() {
    //get_invoicesbyRegoin("");
  }
  void setvalue(user){
    usercurrent=user;
    notifyListeners();
  }
  List<InvoiceModel> listinvoiceClient=[];
  List<DeletedinvoiceModel> listdeletedinvoice=[];
  List<ProductsInvoice> listproductinvoic=[];
  List<DeletedinvoiceModel> listdeleted=[];
  List<InvoiceModel> listinvoicebyregoin=[];
  List<InvoiceModel> listinvoices=[];
  List<InvoiceModel> listinvoicesMarketing=[];
  List<InvoiceModel> listinvoicesApproved=[];
  List<InvoiceModel> listInvoicesAccept=[];//مشتركين
  //List<>
  //List<>
  Future<void> searchProducts(String productName) async {
    List<InvoiceModel> _listInvoicesAccept=[];

    // code to convert the first character to uppercase
    String searchKey =productName;//
    if(productName.isNotEmpty){
      if(listInvoicesAccept.isNotEmpty ){
        listInvoicesAccept.forEach((element) {
          if(element.name_enterprise!.contains(searchKey,0)
              || element.mobile!.contains(searchKey,0)
          ||element.nameClient!.contains(searchKey,0)
          )
            _listInvoicesAccept.add(element);
        });
      }
      listInvoicesAccept=_listInvoicesAccept;
    }
     //else listInvoicesAccept=userall;
    notifyListeners();
  }
  Future<void> searchwait(String productName) async {
    List<InvoiceModel> _listInvoicesAccept=[];
    // code to convert the first character to uppercase
    String searchKey =productName;//
    if(productName.isNotEmpty){
      if(listInvoicesAccept.isNotEmpty ){
        listInvoicesAccept.forEach((element) {
          if(element.name_enterprise!.contains(searchKey,0)
          || element.mobile!.contains(searchKey,0)
          || element.nameClient!.contains(searchKey,0)
          )
            _listInvoicesAccept.add(element);
        });
        listInvoicesAccept=_listInvoicesAccept;
      }}
    else getinvoice_Local("مشترك",'approved client',null);
    notifyListeners();
  }
  Future<void>  searchmarketing(String productName) async {
    List<InvoiceModel> _listInvoicesAccept=[];
    // code to convert the first character to uppercase
    String searchKey =productName;//
    if(productName.isNotEmpty){
      if(listinvoicesMarketing.isNotEmpty ){
        listinvoicesMarketing.forEach((element) {
          if(element.name_enterprise!.contains(searchKey,0)
              || element.mobile!.contains(searchKey,0)
          ||element.nameClient!.contains(searchKey,0)
          )
            _listInvoicesAccept.add(element);
        });
        listinvoicesMarketing=_listInvoicesAccept;
      }}
    else getinvoice_marketing();//getinvoice_Local("مشترك",'approved client',null);
    notifyListeners();
  }

  void getinvoice_marketing() {
    listinvoicesMarketing=[];
    isloading=true;
    notifyListeners();
        listinvoices.forEach((element) {
          if( element.ismarketing=='1' && element.isApprove == "1")
            listinvoicesMarketing.add(element);
        });
        isloading=false;
    notifyListeners();
  }
  void getfilterinvoice(String? regoin){
    listInvoicesAccept=[];
      if(regoin!=null){
        if(regoin!='0'){
          listinvoices.forEach((element) {
            if(element.fk_regoin==regoin)
              listInvoicesAccept.add(element);
          });
        }
        else{//الكل لفلتر المنطقة
          listinvoices.forEach((element) {
            if( element.fk_country==usercurrent!.fkCountry)
              listInvoicesAccept.add(element);
          });
        }
      }
      notifyListeners();
  }
  Future<void> getfilterinvoicesclient(String? filter,String? regoin)async{
    List<InvoiceModel> _listInvoicesAccept=[];
    if(regoin==null){
      print(filter);
      if(listInvoicesAccept.isNotEmpty){
        if(filter=='الكل') {
          _listInvoicesAccept = listInvoicesAccept;
          print('serch الكل');
        }
        if(filter=='بالإنتظار')
          listInvoicesAccept.forEach((element) {
            print(element.isdoneinstall);
            if( element.isdoneinstall==null) {
              _listInvoicesAccept.add(element);
              print('serch بالانتظار');

            }
          });
        if(filter=='تم التركيب')
          listInvoicesAccept.forEach((element) {
            if( element.isdoneinstall=='1') {
              _listInvoicesAccept.add(element);
              print('serch تم التركيب');

            }
          });
      }}
    else{
      if(listInvoicesAccept.isNotEmpty){
        if(filter=='الكل')
          listInvoicesAccept.forEach((element) {
            if(element.fk_regoin==regoin) {
              _listInvoicesAccept.add(element);
              print('regoin الكل');

            }
          });

        if(filter=='بالإنتظار')
          listInvoicesAccept.forEach((element) {
            if( element.isdoneinstall.toString()==null
                && element.fk_regoin==regoin) {
              _listInvoicesAccept.add(element);
              print('regoin بالإنتظار');
            }
          });
        if(filter=='تم التركيب')
          listInvoicesAccept.forEach((element) {
            if( element.isdoneinstall=='1'&&element.fk_regoin==regoin) {
              _listInvoicesAccept.add(element);
              print('regoin تم التركيب');

            }
          });
      }
    }
    listInvoicesAccept= _listInvoicesAccept;
    notifyListeners();
  }
  Future<void> getclienttype_filter(String? filter,String? regoin,String tyype)async{
    // listInvoicesAccept=[];
    if(tyype=='only')await getinvoice_Local("مشترك",'approved only',null);
    if(tyype=='client')await getinvoice_Local("مشترك",'approved client',null);
    if(tyype=='not')await getinvoice_Local("مشترك",'not approved',null);
    if(tyype=='out')await getinvoice_Local("مستبعد",'out',null);

    List<InvoiceModel> _listInvoicesAccept=[];
    if(regoin==null){
      print(filter);
    if(listInvoicesAccept.isNotEmpty){
      if(filter=='الكل') {
        _listInvoicesAccept = listInvoicesAccept;
        print('serch الكل');
      }
       if(filter=='بالإنتظار')
        listInvoicesAccept.forEach((element) {
          print(element.isdoneinstall);
        if( element.isdoneinstall==null) {
          _listInvoicesAccept.add(element);
          print('serch بالانتظار');

        }
      });
      if(filter=='تم التركيب')
        listInvoicesAccept.forEach((element) {
          if( element.isdoneinstall=='1') {
            _listInvoicesAccept.add(element);
            print('serch تم التركيب');

          }
        });
    }}
    else{
      if(listInvoicesAccept.isNotEmpty){
        if(filter=='الكل')
          listInvoicesAccept.forEach((element) {
            if(element.fk_regoin==regoin) {
              _listInvoicesAccept.add(element);
              print('regoin الكل');

            }
          });

        if(filter=='بالإنتظار')
          listInvoicesAccept.forEach((element) {
            if( element.isdoneinstall.toString()==null
                && element.fk_regoin==regoin) {
              _listInvoicesAccept.add(element);
              print('regoin بالإنتظار');
            }
          });
        if(filter=='تم التركيب')
          listInvoicesAccept.forEach((element) {
            if( element.isdoneinstall=='1'&&element.fk_regoin==regoin) {
              _listInvoicesAccept.add(element);
              print('regoin تم التركيب');

            }
          });
      }
    }
     listInvoicesAccept= _listInvoicesAccept;
    notifyListeners();
  }
    Future<void> getclienttype_marketing(
        String? filter,
        String? regoin,String tyype) async {
    getinvoice_marketing();
    List<InvoiceModel> _listInvoicesAccept=[];
    if(regoin==null){
      print(filter);
    if(listinvoicesMarketing.isNotEmpty){
      if(filter=='الكل') {
        _listInvoicesAccept = listinvoicesMarketing;
        print('serch الكل');
      }
       if(filter=='بالإنتظار')
         listinvoicesMarketing.forEach((element) {
          print(element.isdoneinstall);
        if( element.isdoneinstall==null) {
          _listInvoicesAccept.add(element);
          print('serch بالانتظار');

        }
      });
      if(filter=='تم التركيب')
        listinvoicesMarketing.forEach((element) {
          if( element.isdoneinstall=='1') {
            _listInvoicesAccept.add(element);
            print('serch تم التركيب');

          }
        });
    }}
    else{
      if(listinvoicesMarketing.isNotEmpty){
        if(filter=='الكل')
          listinvoicesMarketing.forEach((element) {
            if(element.fk_regoin==regoin) {
              _listInvoicesAccept.add(element);
              print('regoin الكل');

            }
          });

        if(filter=='بالإنتظار')
          listinvoicesMarketing.forEach((element) {
            if( element.isdoneinstall.toString()==null
                && element.fk_regoin==regoin) {
              _listInvoicesAccept.add(element);
              print('regoin بالإنتظار');
            }
          });
        if(filter=='تم التركيب')
          listinvoicesMarketing.forEach((element) {
            if( element.isdoneinstall=='1'&&element.fk_regoin==regoin) {
              _listInvoicesAccept.add(element);
              print('regoin تم التركيب');

            }
          });
      }
    }
    listinvoicesMarketing= _listInvoicesAccept;
    notifyListeners();
  }

  Future<void> getfilterview(String? regoin,String tyype)async{
    listInvoicesAccept=[];
    notifyListeners();
    if(tyype=='only')await getinvoice_Local("مشترك",'approved only',null);
    if(tyype=='client')await getinvoice_Local("مشترك",'approved client',null);
    if(tyype=='not')await getinvoice_Local("مشترك",'not approved',null);
    List<InvoiceModel> _listInvoicesAccept=[];
    if(regoin!='0')
    listInvoicesAccept.forEach((element) {
      if(element.fk_regoin==regoin) {
        _listInvoicesAccept.add(element);
        print('regoin الكل');

      }
    });
    else{
      listInvoicesAccept.forEach((element) {
        if(element.fk_country==usercurrent!.fkCountry) {
          _listInvoicesAccept.add(element);
          print('regoin الكل');

        }
      });
    }
    listInvoicesAccept= _listInvoicesAccept;
    notifyListeners();
  }
Future<void> getinvoice_Localwithprev() async{
  List<InvoiceModel> list=[];
  await getinvoiceswithprev();
  isloading=true;
  notifyListeners();
  listInvoicesAccept.forEach((element) {

          if (element.stateclient == 'مشترك'
              && element.isApprove == "1")
            list.add(element);
        });
  listInvoicesAccept=list;
  isloading=false;
  // if(listInvoicesAccept.isEmpty)listInvoicesAccept=listinvoices;
  notifyListeners();
}
  Future<void> getinvoice_Local(String searchfilter,String type
      ,String? approvetype
      // , List<ClientModel> list
      ) async {
    List<InvoiceModel> list=[];
    isloading=true;
    notifyListeners();
    listInvoicesAccept=[];

    print('dcvcvvvvvvvvvvvvvvvvvvvvvvvvv');
    print(approvetype);
    if(approvetype==null){
      print('dsklmckdsclks');
   await getinvoices();
    if(listinvoices.isNotEmpty) {
      if (type == 'approved only')
        listinvoices.forEach((element) {

          if (element.stateclient == searchfilter
              && element.isApprove == "1")
            list.add(element);
        });
      if (type == 'approved client')
        listinvoices.forEach((element) {
          if (element.type_client == searchfilter && element.isApprove == "1")
            list.add(element);
        });
      if (type == 'not approved')
        listinvoices.forEach((element) {
          if (element.stateclient == searchfilter && element.isApprove == null)
            list.add(element);
        });
      if (type == 'out')
        listinvoices.forEach((element) {
          if (element.stateclient == searchfilter)
            list.add(element);
        });
    }}else{
      if(approvetype=='country')await getinvoices();
      if(approvetype=='regoin')await get_invoicesbyRegoin([]);
      listinvoices.forEach((element) {
        if (element.stateclient == searchfilter &&
            element.isApprove == null)
          list.add(element);
      });
    }
    listInvoicesAccept=list;
    isloading=false;
    // if(listInvoicesAccept.isEmpty)listInvoicesAccept=listinvoices;
    notifyListeners();
  }

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
    listdeletedinvoice.add(value);
    notifyListeners();
  }
  void removeinvoicedeleted(index){
    listdeletedinvoice.removeAt(index);
    notifyListeners();
  }

  Future<bool> setApproveclient_vm(
      Map<String, dynamic?> body,String? idInvoice) async {

    InvoiceModel? data = await Invoice_Service()
        .setApproveClient(body,idInvoice!);
    int index = listinvoices.indexWhere((element) =>
    element.idInvoice == idInvoice);
    int iindex=listInvoicesAccept.indexWhere((element) =>
    element.idInvoice==idInvoice);
    if(data!=null) {

      listinvoices[index] = data;

    }else{
      listinvoices.removeAt(index);
    }
    listInvoicesAccept.removeAt(iindex);
    notifyListeners();

    return true;
  }
  // fk_idUser
  Future<void> get_invoiceclientlocal(String? fk_client,String type
     // ,List<InvoiceModel> list
      ) async {
    listinvoiceClient=[];
    notifyListeners();
    //await getinvoices();
    //seacrh for invoice in list
    if(type=='مشترك'){
    //listinvoiceClient=[];
    listinvoices.forEach((element) {
      if( element.fkIdClient==fk_client&&element.isApprove!=null)
      listinvoiceClient.add(element);
    });
    }else{

      //listinvoiceClient=[];
      listinvoices.forEach((element) {
        if( element.fkIdClient==fk_client)
          listinvoiceClient.add(element);
      });
    }
    // if(index !=-1)
    //   listinvoiceClient=[];
    notifyListeners();
  }
  void setvaluepriv(privilgelistparam){
    print('in set privilge client vm');
    privilgelist=privilgelistparam;
    notifyListeners();
  }

  List<PrivilgeModel> privilgelist=[];
  Future<void> getinvoices() async {
    listinvoices = await Invoice_Service().getinvoice(usercurrent!.fkCountry.toString());
    listInvoicesAccept=listinvoices;
    notifyListeners();
  }

  Future<void> getinvoiceswithprev() async {
    // if(listClient.isEmpty)
    //main list
    bool res= privilgelist.firstWhere(
            (element) => element.fkPrivileg=='1').isCheck=='1'?true:false;
    if(res) {
    listinvoices = await Invoice_Service().getinvoice(usercurrent!.fkCountry.toString());
    }
    else{
      res= privilgelist.firstWhere(
            (element) => element.fkPrivileg=='6').isCheck=='1'?true:false;
    if(res) {
    listinvoices = await Invoice_Service().getinvoice(usercurrent!.fkCountry.toString());
    }else{
      res= privilgelist.firstWhere(
              (element) => element.fkPrivileg=='38').isCheck=='1'?true:false;
      if(res) {
        listinvoices = listinvoicebyregoin = await Invoice_Service()
            .getinvoicebyregoin(usercurrent!.fkRegoin!);
      }}}
    listInvoicesAccept=listinvoices;
    notifyListeners();
  }
  Future<void> get_invoicesbyIduser(List<InvoiceModel> list) async {
    listinvoicebyregoin=[];
    //cahe_data_source_invoice().clearCache();
    if(list.isNotEmpty){
      list.forEach((element) {
        if( element.fkIdUser==usercurrent!.idUser)
          listinvoicebyregoin.add(element);
      });

    }
    else{
      listinvoices = await Invoice_Service()
          .getinvoicebyiduser(usercurrent!.idUser!);
      listinvoices=listinvoicebyregoin;
    }

    notifyListeners();
  }
  InvoiceModel? get_byIdInvoice(String id_invoice)  {

    InvoiceModel? inv;
       listinvoices.forEach((element) {
        if( element.idInvoice==id_invoice)
          inv= element;
      });
    if(inv==null) getinvoices();

    return inv;//InvoiceModel(products: []);
    // else{
    //   listinvoices = await Invoice_Service()
    //       .getinvoicebyiduser(usercurrent!.idUser!);
    //   listinvoices=listinvoicebyregoin;
    // }

    //notifyListeners();
  }
  Future<void> get_invoicesbyRegoin(List<InvoiceModel> list) async {
    listinvoicebyregoin=[];
    //cahe_data_source_invoice().clearCache();
   if(list.isNotEmpty){
     list.forEach((element) {
       if( element.fk_regoin==usercurrent!.fkRegoin)
         listinvoicebyregoin.add(element);
     });
   }
   else{
     listinvoicebyregoin = await Invoice_Service()
         .getinvoicebyregoin(usercurrent!.fkRegoin!);
     listinvoices=listinvoicebyregoin;
   }
   // listinvoicesApproved=listinvoices;
    listInvoicesAccept=listinvoices;
    notifyListeners();
  }
  Future<String> add_invoiceclient_vm(
      Map<String, dynamic?> body,File? file) async {

       String res='done';
      InvoiceModel data = await Invoice_Service().addInvoice(body,file);
   //  if(data !=null){
       print('resssssssssssssss');
    listinvoices.insert(0,data);
    listinvoiceClient.insert(0, data);
    res=data.idInvoice.toString();
    print(res);
   // } else res='false';
    notifyListeners();
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
  Future<bool> update_invoiceProduct_vm(Map<String, dynamic?>? body,String idInvoiceProduct) async {
    print('$body');
    bool res = await Invoice_Service().updateProductInvoice(body!,idInvoiceProduct);
      //listproductinvoic.insert(0, ProductsInvoice.fromJson(body));
      notifyListeners();

    return res;
  }

  Future<bool> update_invoiceclient_vm(
      Map<String, dynamic?> body,String? idInvoice,File? file) async {
    InvoiceModel data=  await Invoice_Service().updateInvoice(body,idInvoice!,file);
      final index=listinvoiceClient.indexWhere(
              (element) => element.idInvoice==idInvoice);
      // body.addAll({
      //   "id_invoice":idInvoice,
      //   "date_create":listinvoiceClient[index].dateCreate.toString(),
      //
      //   "products":listproductinvoic.map((e)=>e.toJson()).toList()
      // });

      listinvoiceClient[index]=data;//InvoiceModel.fromJson(body);
      final index1=listinvoices.indexWhere((element) => element.idInvoice==idInvoice);

      listinvoices[index1]= data;

    int index2=listInvoicesAccept.indexWhere((element) => element.idInvoice==idInvoice);
    if(index2!=-1)
    listInvoicesAccept[index2]= data;

    //InvoiceModel.fromJson(body);
      //listProduct.insert(0, ProductModel.fromJson(body));
      notifyListeners();

    return true;
  }

  Future<String> delete_invoice(Map<String,String>body, String? id_invoice) async {

    int index=listinvoiceClient.indexWhere(
            (element) => element.idInvoice==id_invoice);
    listinvoiceClient.removeAt(index);
    String res = await Invoice_Service()
    .deleteInvoiceById(body);
    print("res in delete invoice "+res);
    //if(res=="done"){
    index=listinvoices.indexWhere(
            (element) => element.idInvoice==id_invoice);
    listinvoices.removeAt(index);

    index=listInvoicesAccept.indexWhere(
            (element) => element.idInvoice==id_invoice);
    listInvoicesAccept.removeAt(index);
      notifyListeners();
    //}
    return res;
  }
  Future<String> deleteProductInInvoice(String? idInvoiceProduct) async {
    String res = await Invoice_Service().deleteProductInInvoice(idInvoiceProduct!);

    if(res=="done"){
      int index=listproductinvoic
          .indexWhere((element) => element.idInvoiceProduct==idInvoiceProduct);
     if(index!=-1) listproductinvoic.removeAt(index);

      notifyListeners();

    }
    return res;
  }
  Future<void> setdate_vm(Map<String, dynamic?> body,String? id_invoice) async {

      int index=listinvoices.indexWhere(
              (element) => element.idInvoice==id_invoice);
      listinvoices[index]=
      await Invoice_Service().setdate(body,id_invoice!);

      // body.addAll(
      //     InvoiceModel.fromJson(listinvoices[index]));
      // listinvoices[index]= InvoiceModel.fromJson(body);
      // //listClient.removeAt(index);
      notifyListeners();

  }
  Future<void> set_state_back(Map<String, dynamic?> body,String? id_invoice) async {


      InvoiceModel data= await Invoice_Service().setstate(body,id_invoice!);
      int index=listinvoices.indexWhere(
              (element) => element.idInvoice==id_invoice);
      listinvoices[index]=data;
      index=listinvoiceClient.indexWhere(
              (element) => element.idInvoice==id_invoice);
      listinvoiceClient[index]=data;
      // listinvoiceClient
      // body.addAll(
      //     InvoiceModel.fromJson(listinvoices[index]));
      // listinvoices[index]= InvoiceModel.fromJson(body);
      // //listClient.removeAt(index);
      notifyListeners();
  }

  Future<void> setdatedone_vm(Map<String, dynamic?> body,String? id_invoice) async {

    int index=listinvoices.indexWhere(
            (element) => element.idInvoice==id_invoice);

    listinvoices[index]= await Invoice_Service().setdatedone(body,id_invoice!);

      // listClient.removeAt(index);
      notifyListeners();


  }

  Future<void> get_invoice_deleted() async {
    if(listdeletedinvoice.isEmpty)
    listdeletedinvoice = await Invoice_Service().getinvoice_deleted(
        usercurrent!.fkRegoin.toString());
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







