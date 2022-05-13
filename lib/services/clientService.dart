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
  Future<List<ClientModel>> updateClient( Map<String,dynamic> body,String idclient) async {
    var data = await Api()
        .post( url:url+"client/clientUpdate.php?id_clients=$idclient",
        body: body );
    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }
    print(prodlist);
    return prodlist;  // );//=="done"? true:false;
  }
  Future<List<ClientModel>> setApproveClient( Map<String,dynamic> body,String idclient) async {
    var data = await Api()
        .post( url:url+"client/setApproveClient.php?id_clients=$idclient",body:
    body
    );
    List<ClientModel> prodlist = [];
    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }
    print(prodlist);
    return prodlist;
    //client/setApproveClient.php
  // return result[0];//=="done"? true:false;
  }
  Future<bool> setfkuserClient( Map<String,dynamic> body,String idclient) async {
    String result = await Api()
        .post( url:url+"client/set_fkuser_transfer.php?id_clients=$idclient",body:
    body
    );
    //client/setApproveClient.php
    return result=="done"? true:false;
  }
  //
  Future<List<ClientModel>> getAllClient(String? fkcountry) async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'client/getClientAll.php?fk_country=$fkcountry');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }
    print(prodlist);
    return prodlist;
  }
  Future<List<ClientModel>> getClientbyuser(String? fk_user) async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'client/getclientbyuser.php?fk_user=$fk_user');
    print('before data');
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
  Future<List<ClientModel>> getAllClientByRegoin(String? regoin) async {
    List<dynamic> data = await Api()
        .get(url:url+ 'client/getclientByRegoin.php?fk_regoin=$regoin');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }
    return prodlist;
  }
}