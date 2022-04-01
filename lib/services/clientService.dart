import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/productmodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class ClientService{

  Future<String> addClient( Map<String,dynamic?> body) async {
    print("$body");
    try{
      String result = await Api()
          .post( url:url+"client/clientAdd.php",
          body: body);
      print(result);
      return result !="error"? result:"false";}
    catch(e){
      print(e);
      return "false";
    }
  }
  //id_product
  Future<bool> updateClient( Map<String,dynamic> body,String idclient) async {
    String result = await Api()
        .post( url:url+"client/clientUpdate.php?id_clients=$idclient",body:
    body
    );
    return result=="done"? true:false;
  }

  Future<List<ClientModel>> getAllClient() async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'client/getClientAll.php');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }
    print(prodlist);
    return prodlist;
  }
  Future<List<ClientModel>> getClientbyuser(String fk_user) async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'client/getclientbyuser.php?fk_user=$fk_user');
print(data);
    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      print(data[i]);
      prodlist.add(ClientModel.fromJson(data[i]));
    }
    print(prodlist);
    return prodlist;
  }
  //
  Future<List<ClientModel>> getAllClientByRegoin(String regoin) async {
    List<dynamic> data = await Api()
        .get(url:url+ 'client/getclientByRegoin.php?fk_regoin=$regoin');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }
    return prodlist;
  }
}