


import 'dart:js';

import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/services/ProductService.dart';
import 'package:crm_smart/services/clientService.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'country_vm.dart';

class client_vm extends ChangeNotifier {
  List<ClientModel> listClient = [];
  List<ClientModel> listClientbyCurrentUser = [];
  List<ClientModel> listClientbyRegoin = [];

  Future<void> getclient_vm() async {
    listClient = await ClientService().getAllClient();

    notifyListeners();
  }
  Future<void> getclientByIdUser_vm(String? fk_user) async {
    listClientbyCurrentUser = await ClientService().getClientbyuser(fk_user!);
    notifyListeners();
  }
  Future<void> getclientByRegoin(String fk_user) async {
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






