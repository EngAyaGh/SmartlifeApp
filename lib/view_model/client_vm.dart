



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
  List<ClientModel> listClientMarketing = [];
  // client_vm(UserModel? currentUser){
  //
  //   usercurrent=currentUser;
  //   notifyListeners();
  // }
  UserModel? usercurrent;
  bool isloading=false;
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
  Future<void> getclienttypeInstall()async {

  }
  Future<void> getclient_Local(String searchfilter
    // , List<InvoiceModel> list
      )
  async {
    listClientAccept=[];
    // notifyListeners();
    isloading=true;
    notifyListeners();
    List<ClientModel> _list=
    await ClientService().getAllClient(usercurrent!.fkCountry.toString());
    // getclient_vm();
    // if(listClient.isEmpty)
    // List<ClientModel> lists=[];
    _list.forEach((element) {
      if( element.typeClient==searchfilter
          && element.isApprove!=null )
        listClientAccept.add(element);
    });
     isloading=false;
    notifyListeners();
  }

  bool getfilterclient(String filter){
    UserModel? user;
    listClient.map(
            (e) {
          e.nameEnterprise!.contains(filter);return true;
        }
    );
    return false;
  }
  ClientModel? selectedclient;
  void changevalueclient(ClientModel? s){
    selectedclient=s;
    notifyListeners();
  }
  void getfilterview(String? regoin){
    List<ClientModel> list=[];
    getclient_Local('مشترك');
    if(regoin!=null){
      if(regoin!='0'){
        listClientAccept.forEach((element) {
          if(element.fkRegoin==regoin)
            list.add(element);
        });
      }
      else{//الكل لفلتر المنطقة
        listClientAccept.forEach((element) {
          if( element.fkcountry==usercurrent!.fkCountry)
            list.add(element);
        });
      }
    }
    listClientAccept=list;
    notifyListeners();
  }
  Future<void> getclientfilter_Local(
      String? searchfilter,String type,String? filter2,String? filter3
      // , List<ClientModel> list
      )
  async {
    // if(listClient.isEmpty)
    // List<ClientModel> lists=[];

    listClientfilter=[];
    if(type=="3"){
      print('kljkjk');
      if(filter2==null){
        if(filter3 !='0')
      listClient.forEach((element) {
        if( element.fkUser==searchfilter&&element.fkRegoin==filter3)
          listClientfilter.add(element);
      });
        else{
          listClient.forEach((element) {
            if( element.fkUser==searchfilter&&element.fkcountry==usercurrent!.fkCountry)
              listClientfilter.add(element);
          });
        }
      }else{
        if(filter3 !='0')
        listClient.forEach((element) {
          if( element.fkUser==searchfilter&&element.typeClient==filter2
              &&element.fkRegoin==filter3)
            listClientfilter.add(element);
        });
        else{
          listClient.forEach((element) {
            if( element.fkUser==searchfilter&&element.typeClient==filter2
                &&element.fkcountry==usercurrent!.fkCountry)
              listClientfilter.add(element);
          });
        }
      }
    }
    if(type=="type"){

      listClient.forEach((element) {
        if( element.typeClient==searchfilter)
          listClientfilter.add(element);
      });
    }
    if(type=="user"){
      print('in user search');
      if(filter2==null){
        listClient.forEach((element) {
      if( element.fkUser==searchfilter)
        listClientfilter.add(element);
    });
      }else{
        listClient.forEach((element) {
          if( element.fkUser==searchfilter&&element.typeClient==filter2)
            listClientfilter.add(element);
        });
      }
    }
    else {
      if(type=="regoin"){
        if(filter2==null) {
          if(searchfilter!='0')
          listClient.forEach((element) {
            if (element.fkRegoin == searchfilter)
              listClientfilter.add(element);
          });
          else{
            listClient.forEach((element) {
              if (element.fkcountry == usercurrent!.fkCountry)
                listClientfilter.add(element);
            });
          }
        }else{
          if(searchfilter!='0')
          listClient.forEach((element) {
            if (element.fkRegoin == searchfilter&&element.typeClient==filter2)
              listClientfilter.add(element);
          });
          else{
            listClient.forEach((element) {
              if (element.fkcountry == usercurrent!.fkCountry &&element.typeClient==filter2)
                listClientfilter.add(element);
            });
          }
        }
      }
    }

    notifyListeners();
  }
  void resetlist(){

   listClientfilter= listClient;
   notifyListeners();
  }
  Future<void> getallclient()async{
    listClient =
        await ClientService().getAllClient(usercurrent!.fkCountry.toString());
    listClientAccept = listClient;
    notifyListeners();
  }

  Future<void> getclient_vm(
     // List<PrivilgeModel> privilgelist
      ) async {
    listClientfilter=[];
    notifyListeners();
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
    //listClient.where((element) => false)
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
  Future<void> getclientMarketing() async {
    //عملائي
    listClientMarketing=[];
    if(listClient.isNotEmpty){
      listClient.forEach((element) {
        if (element.ismarketing =='1' )
          listClientMarketing.add(element);
      } );
    }}

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
    ClientModel res = await ClientService().addClient(body);
    //if (res!="false") {
      // body.addAll({
      //   'id_clients':res,
      //   'nameUser':username,
      //   'name_regoin':regoin
      // });

      //listClientbyCurrentUser.insert(0, ClientModel.fromJson(body));
      listClient.insert(0,res);
      listClientfilter.insert(0, res);
      // ClientModel.fromJson(body));
      notifyListeners();
    //}
    return "done";
  }

  Future<bool> updateclient_vm(Map<String, dynamic?> body,String? id_client) async {
    ClientModel data = await ClientService().updateClient(
        body,id_client!);

    int index= listClient.indexWhere((element) =>
    element.idClients==id_client);

    listClient[index]=data;

    index= listClientfilter.indexWhere((element) =>
    element.idClients==id_client);
   if(index !=-1)
    listClientfilter[index]=data;
    //ClientModel.fromJson(body);
      //listProduct.insert(0, ProductModel.fromJson(body));
      notifyListeners();

    return true;
  }
  void getudate(){
    listClientfilter=listClient;
    notifyListeners();
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

  Future<void> searchProducts(
      String productName) async {
    List<ClientModel> clientlistsearch=[];
    // code to convert the first character to uppercase
    String searchKey =productName;//
    // productName[0].toUpperCase() +
    //   productName.substring(1);

    if(productName.isNotEmpty ){
      listClientfilter.forEach((element) {
        if(element.nameEnterprise!.contains(searchKey,0)
            || element.nameClient!.contains(searchKey,0)
            || element.mobile!.contains(searchKey,0) )
          clientlistsearch.add(element);
      });
      listClientfilter=clientlistsearch;

      // if(clientlistsearch.isEmpty){
      //   list.forEach((element) {
      //     if(element.nameClient!.contains(searchKey,0))
      //       clientlistsearch.add(element);
      //   });
      // }
      //   if(clientlistsearch.isEmpty){
      //     list.forEach((element) {
      //       if(element.mobile!.contains(searchKey,0))
      //         clientlistsearch.add(element);
      //     });
      //   }
    }else getclient_vm();

    notifyListeners();
    //return clientlistsearch;
  }
  Future<void> searchmarket(
      String productName) async {
    List<ClientModel> clientlistsearch=[];
    // code to convert the first character to uppercase
    String searchKey =productName;//

    if(productName.isNotEmpty ){
      listClientMarketing.forEach((element) {
        if(element.nameEnterprise!.contains(searchKey,0)
            || element.nameClient!.contains(searchKey,0)
            || element.mobile!.contains(searchKey,0) )
          clientlistsearch.add(element);
      });
      listClientMarketing=clientlistsearch;

    }else getclientMarketing();

    notifyListeners();
    //return clientlistsearch;
  }
  //listClientAccept
  Future<void> searchclientAccept(
      String productName) async {
    List<ClientModel> clientlistsearch=[];
    // code to convert the first character to uppercase
    String searchKey =productName;//
    // productName[0].toUpperCase() +
    //   productName.substring(1);

    if(productName.isNotEmpty ){
      listClientAccept.forEach((element) {
        if(element.nameEnterprise!.contains(searchKey,0)
            || element.nameClient!.contains(searchKey,0)
            || element.mobile!.contains(searchKey,0) )
          clientlistsearch.add(element);
      });
      listClientAccept=clientlistsearch;
    }else getclient_Local('مشترك');
    notifyListeners();
    //return clientlistsearch;
  }
}






