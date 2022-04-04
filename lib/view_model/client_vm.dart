

import 'dart:js';

import 'package:crm_smart/Repository/invoice_repo/cach_data_source.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/services/ProductService.dart';
import 'package:crm_smart/services/clientService.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'country_vm.dart';

const CACHE_ClientByUser_KEY = "CACHE_Client_KEY";
const CACHE_ClientByUser_INTERVAL = 60 * 1000; // 1 MINUTE IN MILLIS

class client_vm extends ChangeNotifier {
  List<ClientModel> listClient = [];
  List<ClientModel> listClientbyCurrentUser = [];
  List<ClientModel> listClientbyRegoin = [];

  Future<void> getclient_vm() async {
    if(listClient.isEmpty)
    listClient = await ClientService().getAllClient();
    notifyListeners();
  }
  Future<void> getclientByIdUser_vm(String? fk_user) async {
    cahe_data_source_client().clearCache();
    listClientbyCurrentUser=[];
    listClientbyCurrentUser = await ClientService()
        .getClientbyuser(fk_user!);

    List<ClientModel>? list=await cahe_data_source_client()
        .getCache(CACHE_ClientByUser_KEY, CACHE_ClientByUser_INTERVAL);

    if(listClientbyCurrentUser.isEmpty){
      print("inside get from api client");
      listClientbyCurrentUser =
      await ClientService().getClientbyuser(fk_user);

      if(listClientbyCurrentUser!=null) {
        print("nukkkkklllll");
      await cahe_data_source_client().saveToCache(listClientbyCurrentUser,
          CACHE_ClientByUser_KEY);
      }
      else {
        print("elsssssss");
      }
    }else{
      if(list!=null){
      print('inside get from cache client');
      listClientbyCurrentUser.addAll(list);
      }
    }
    notifyListeners();
  }
  Future<void> getclientByRegoin(String fk_user) async {
    if(listClientbyRegoin.isEmpty)
    listClientbyRegoin = await ClientService().getAllClientByRegoin(fk_user);
    notifyListeners();
  }

  Future<String> addclient_vm(Map<String, dynamic?> body,String username,String regoin) async {
    String res = await ClientService().addClient(body);
    if (res!="false") {
      body.addAll({
        'id_clients':res,
        'nameUser':username,
        'name_regoin':regoin
      });

      listClientbyCurrentUser.insert(0, ClientModel.fromJson(body));
      notifyListeners();
    }
    return res;
  }

  Future<bool> updateclient_vm(Map<String, dynamic?> body,String id_client) async {
    bool res = await ClientService().updateClient(body,id_client);
    if (res) {
      final index=listClient.indexWhere((element) => element.idClients==id_client);
      listClient[index]=ClientModel.fromJson(body);
      //listProduct.insert(0, ProductModel.fromJson(body));
      notifyListeners();
    }
    return res;
  }



}






