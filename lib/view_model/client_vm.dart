



import 'package:crm_smart/Repository/invoice_repo/cach_data_source.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/ProductService.dart';
import 'package:crm_smart/services/clientService.dart';
import 'package:crm_smart/ui/widgets/widgetcalendar/utils.dart';
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
    print('in set usercurrent client vm');

    usercurrent=user;
    notifyListeners();
  }
  void setvaluepriv(privilgelistparam){
    print('in set privilge client vm');
    privilgelist=privilgelistparam;
    notifyListeners();
  }

  List<PrivilgeModel> privilgelist=[];

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
          if( element.fkRegoin==searchfilter)
            listClientfilter.add(element);
        });
      }
    }

    notifyListeners();
  }
  Future<void> getclient_vm(
     // List<PrivilgeModel> privilgelist
      ) async {

   // if(listClient.isEmpty)
    //main list
    bool res= privilgelist.firstWhere(
            (element) => element.fkPrivileg=='8').isCheck=='1'?true:false;
    if(res) {
      listClient =
      await ClientService().getAllClient(usercurrent!.fkCountry.toString());
      listClientfilter = listClient;
    }
    else {
    res= privilgelist.firstWhere(
            (element) => element.fkPrivileg=='15').isCheck=='1'?true:false;
    if(res) {
      listClient =
      await ClientService().getAllClientByRegoin(usercurrent!.fkRegoin.toString());
      listClientfilter = listClient;
    } else{

      res= privilgelist.firstWhere(
              (element) => element.fkPrivileg=='16').isCheck=='1'?true:false;
      if(res) {
        listClient =
        await ClientService().getClientbyuser(usercurrent!.idUser.toString());
        listClientfilter = listClient;
      }
    } }
    notifyListeners();
  }

  ClientModel? get_byIdClient(String idClient,)  {

    ClientModel? inv;
    listClient.forEach((element) {
        if( element.idClients==idClient)
          inv= element;
      });
    if(inv==null) getclient_vm();

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
    ClientModel data = await ClientService().updateClient(body,id_client!);

      int index=listClientbyCurrentUser.indexWhere((element)
      => element.idClients==id_client);
      // body.addAll({
      //   'id_clients':id_client,
      //   'date_create':listClientbyCurrentUser[index].dateCreate,
      //   'nameUser':listClientbyCurrentUser[index].nameUser,
      //   'name_regoin':listClientbyCurrentUser[index].name_regoin.toString(),
      //   'fk_regoin':listClientbyCurrentUser[index].fkRegoin,
      //   'fk_user':listClientbyCurrentUser[index].fkUser,
      //   'nameCountry':listClientbyCurrentUser[index].nameCountry,
      //   'date_price':listClientbyCurrentUser[index].date_price,
      //   "amount_paid":listClientbyCurrentUser[index].amount_paid,
      //   "total":listClientbyCurrentUser[index].total,
      //
      // });
      listClient[index]=data;//ClientModel.fromJson(body);
      //listProduct.insert(0, ProductModel.fromJson(body));
      notifyListeners();

    return true;
  }
  void getudate(){
    listClientfilter=listClient;
    notifyListeners();
  }
  Future<bool> setApproveclient_vm(Map<String, dynamic?> body,String? id_client) async {
    ClientModel data = await ClientService().setApproveClient(body,id_client!);

      int index=listClient.indexWhere((element) => element.idClients==id_client);
       // body.addAll({
       // 'id_clients':listClient[index].idClients,
       // 'date_approve':Utils.toDate(DateTime.now()),
       // "type_client": listClient[index].typeClient,
       // 'name_client': listClient[index].nameClient,
       // //'name_enterprise':
       // 'type_job': listClient[index].typeJob,
       // 'location': listClient[index].location,
       // 'city': listClient[index].city,
       // "mobile": listClient[index].mobile,
       // "date_changetype": listClient[index].dateChangetype,
       // "offer_price": listClient[index].offer_price,
       // "reason_change": listClient[index].reasonChange,
       // "user_do": listClient[index].user_do,
       // "desc_reason": listClient[index].desc_reason,
       // "value_back": listClient[index].value_back,
       // 'name_regoin': listClient[index].name_regoin,
       // "nameUser":listClient[index].nameUser,
       // "amount_paid":listClient[index].amount_paid,
       // "total":listClient[index].total
       // //   'iduser_approve':listClientbyCurrentUser[index].iduser_approve,
       // });
      listClient[index]=data;//ClientModel.fromJson(body);
      //listProduct.insert(0, ProductModel.fromJson(body));
      notifyListeners();

    return true;
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






