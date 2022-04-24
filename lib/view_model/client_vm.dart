



import 'package:crm_smart/Repository/invoice_repo/cach_data_source.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/ProductService.dart';
import 'package:crm_smart/services/clientService.dart';
import 'package:crm_smart/ui/widgets/widget%20calendar/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'country_vm.dart';

const CACHE_ClientByUser_KEY = "CACHE_Client_KEY";
const CACHE_ClientByUser_INTERVAL = 60 * 1000; // 1 MINUTE IN MILLIS

class client_vm extends ChangeNotifier {
  List<ClientModel> listClient = [];
  List<ClientModel> listClientAccept = [];
  List<ClientModel> listClientbyCurrentUser = [];
  List<ClientModel> listClientbyRegoin = [];
  List<ClientModel> listClientfilter = [];

  // client_vm(UserModel? currentUser){
  //
  //   usercurrent=currentUser;
  //   notifyListeners();
  // }
  UserModel? usercurrent;

  void setvalue(user){
    usercurrent=user;
    notifyListeners();
  }

  Future<void> getclient_Local(String searchfilter
     // , List<ClientModel> list
      )
  async {
    // if(listClient.isEmpty)
    // List<ClientModel> lists=[];
    listClientAccept=[];
    listClient.forEach((element) {
      if( element.typeClient==searchfilter)
        listClientAccept.add(element);
    });

    notifyListeners();
  }
  Future<void> getclientfilter_Local(
      String? searchfilter,String type
      // , List<ClientModel> list
      )
  async {
    // if(listClient.isEmpty)
    // List<ClientModel> lists=[];
    listClientfilter=[];
    if(type=="user"){
      print(searchfilter);
      print('in user search');
    listClient.forEach((element) {
      if( element.fkUser==searchfilter)
        listClientfilter.add(element);
    });
    }
    else {
      if(type=="regoin"){
        print('regoin');
        print(searchfilter);
        listClient.forEach((element) {
          if( element.fkUser==searchfilter)
            listClientfilter.add(element);
        });


      }
    }

    notifyListeners();
  }
  Future<void> getclient_vm() async {
   // if(listClient.isEmpty)
    //main list
    listClient = await ClientService().getAllClient(usercurrent!.fkCountry.toString());
    notifyListeners();
  }
  ClientModel? get_byIdClient(String idClient)  {

    ClientModel? inv;
    listClient.forEach((element) {
        if( element.idClients==idClient)
          inv= element;
      });
    if(inv==null) getclientByRegoin([]);

    return inv;
  }
  Future<void> getclientByIdUser_vm(List<ClientModel> list) async {
   //عملائي
    listClientbyCurrentUser=[];
    if(list.isNotEmpty){
    list.forEach((element) {
      if( element.fkUser==usercurrent!.idUser)
        listClientbyCurrentUser.add(element);
    });
    }
else{
      //عملائي
      //in low level employee
      listClientbyCurrentUser = await ClientService()
          .getClientbyuser(usercurrent!.idUser.toString());
      listClient=listClientbyCurrentUser;

    }

    // List<ClientModel>? list=await cahe_data_source_client()
    //     .getCache(CACHE_ClientByUser_KEY, CACHE_ClientByUser_INTERVAL);
    //
    // if(listClientbyCurrentUser.isEmpty){
    //   print("inside get from api client");
    //   listClientbyCurrentUser =
    //   await ClientService().getClientbyuser(usercurrent!.idUser.toString());
    //
    //   if(listClientbyCurrentUser!=null) {
    //     print("nukkkkklllll");
    //   await cahe_data_source_client().saveToCache(listClientbyCurrentUser,
    //       CACHE_ClientByUser_KEY);
    //   }
    //   else {
    //     print("elsssssss");
    //   }
    // }else{
    //   if(list!=null){
    //   print('inside get from cache client');
    //   listClientbyCurrentUser.addAll(list);
    //   }
    // }
    notifyListeners();
  }
  Future<void> getclientByRegoin(List<ClientModel> list) async {
    //if(listClientbyRegoin.isEmpty)
    listClientbyRegoin=[];
    if(list.isNotEmpty){
      list.forEach((element) {
        if( element.fkUser==usercurrent!.idUser)
          listClientbyRegoin.add(element);
      });
    }else {
      //get data from db >>> this mean that main list in here initalise
      listClientbyRegoin = await ClientService()
          .getAllClientByRegoin(usercurrent!.fkRegoin.toString());
       listClient=listClientbyRegoin;
    }
    listClientfilter= listClient;
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

      //listClientbyCurrentUser.insert(0, ClientModel.fromJson(body));
      listClient.insert(0, ClientModel.fromJson(body));
      notifyListeners();
    }
    return res;
  }

  Future<bool> updateclient_vm(Map<String, dynamic?> body,String? id_client) async {
    bool res = await ClientService().updateClient(body,id_client!);
    if (res) {
      int index=listClientbyCurrentUser.indexWhere((element)
      => element.idClients==id_client);
      body.addAll({
        'id_clients':id_client,
        'nameUser':listClientbyCurrentUser[index].nameUser,
        'name_regoin':listClientbyCurrentUser[index].name_regoin.toString(),
        'fk_regoin':listClientbyCurrentUser[index].fkRegoin,
        'fk_user':listClientbyCurrentUser[index].fkUser,
        'nameCountry':listClientbyCurrentUser[index].nameCountry,
        'date_price':listClientbyCurrentUser[index].date_price,
      });
      listClient[index]=ClientModel.fromJson(body);
      //listProduct.insert(0, ProductModel.fromJson(body));
      notifyListeners();
    }
    return res;
  }
  void getudate(){
    listClientfilter=listClient;
    notifyListeners();
  }
  Future<bool> setApproveclient_vm(Map<String, dynamic?> body,String? id_client) async {
    bool res = await ClientService().setApproveClient(body,id_client!);
    if (res) {
      int index=listClient.indexWhere((element) => element.idClients==id_client);
       body.addAll({
       'id_clients':listClient[index].idClients,
       'date_approve':Utils.toDate(DateTime.now()),
       "type_client": listClient[index].typeClient,
       'name_client': listClient[index].nameClient,
       //'name_enterprise':
       'type_job': listClient[index].typeJob,
       'location': listClient[index].location,
       'city': listClient[index].city,
       "mobile": listClient[index].mobile,
       "date_changetype": listClient[index].dateChangetype,
       "offer_price": listClient[index].offer_price,
       "reason_change": listClient[index].reasonChange,
       "user_do": listClient[index].user_do,
       "desc_reason": listClient[index].desc_reason,
       "value_back": listClient[index].value_back,
       'name_regoin': listClient[index].name_regoin,
       "nameUser":listClient[index].nameUser,
       //   'iduser_approve':listClientbyCurrentUser[index].iduser_approve,
       });
      listClient[index]=ClientModel.fromJson(body);
      //listProduct.insert(0, ProductModel.fromJson(body));
      notifyListeners();
    }
    return res;
  }
  Future<bool> setfkUserclient_vm(Map<String, dynamic?> body,String? id_client) async {
    bool res = await ClientService().setfkuserClient(body,id_client!);
    if (res) {
      int index=listClient.indexWhere(
              (element) => element.idClients==id_client);

      listClient.removeAt(index);
      notifyListeners();
    }
    return res;
  }
  void removeclient(idclient){
    int index=listClient.indexWhere(
            (element) => element.idClients==idclient);

    listClient.removeAt(index);
    notifyListeners();
  }

}






