



import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/ticketmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class ticket_vm extends ChangeNotifier{

  List<TicketModel> listticket=[];
  List<TicketModel> listticket_client=[];
  List<TicketModel> listticket_clientfilter=[];
  List<TicketModel> tickesearchlist=[];
  UserModel? usercurrent;
  bool isloading=false;
  void setvalue(user){
    usercurrent=user;
    notifyListeners();
  }
  //List<String> Typeticket= ['مغلقة','مستلمة','جديدة'];

  int selectedtypeticket=0;

  void changeticket(int s){
    selectedtypeticket=s;
    notifyListeners();
  }
   bool addvalue=false;
  Future<void> addticket(Map<String, dynamic?> body)async {
    addvalue=true;
    notifyListeners();
    var data= await Api()
        .post( url:url+"ticket/add_ticket.php",body:
    body
    );
    TicketModel tm=  TicketModel.fromJson(data[0]);
    listticket.add(tm);
    addvalue=false;
    tickesearchlist=listticket;
    listticket_clientfilter=listticket;
    notifyListeners();
  }
  Future<void> searchProducts(
      String productName) async {
    List<TicketModel> ticketlistsearch=[];
    // code to convert the first character to uppercase
    String searchKey =productName;//

    print('search');
    print(searchKey);
    if(productName.isNotEmpty){
    if(listticket.isNotEmpty ){
      listticket.forEach((element) {
        if(element.nameEnterprise.contains(searchKey,0)
            || element.nameClient.contains(searchKey,0)
            || element.mobile!.contains(searchKey,0) )
          ticketlistsearch.add(element);
      });
      tickesearchlist=ticketlistsearch;
    }}else
      tickesearchlist=listticket;
      notifyListeners();
  }
  Future<bool> updateTicketvm(Map<String, dynamic?> body,String? id_ticket)
  async {
    var data = await Api()
        .post(
        url:url+"ticket/recive_ticket.php?id_ticket=$id_ticket",
        body: body
    );
    int index=listticket.indexWhere(
            (element) => element.idTicket==id_ticket);

    listticket[index]=TicketModel.fromJson(data[0]);
    tickesearchlist=listticket;

    notifyListeners();

    return true;
  }
  Future<void> setfTicketclient_vm(Map<String, dynamic?> body,String? id_ticket) async {
   var data= await Api()
        .post( url:url+"ticket/trasfer_ticket.php?id_ticket=$id_ticket",
        body: body
    );
      int index=listticket.indexWhere(
              (element) => element.idTicket==id_ticket);
    listticket[index]=TicketModel.fromJson(data[0]);
   // listticket.removeAt(index);
   tickesearchlist=listticket;
      notifyListeners();

  }
 Future< void> getclient_ticket(String fkIdClient)async{
    listticket_client=[];
    await getticket();
    //notifyListeners();
    int index=0;
   if(listticket.isNotEmpty){

    listticket.forEach((element) {
    if( element.fkClient==fkIdClient)
    {
      listticket_client.add(element);
      print('vghfggcgbbbbbbbbbbbbbbbbbbbb');
      print(listticket_client[index].nameEnterprise);
      print(fkIdClient);
      index++;
    }
  });
   }
   notifyListeners();
}

 Future<void> getclientticket_filter(String filter)async{
  await getticket();
  if(listticket.isNotEmpty){
    listticket_clientfilter=[];

    listticket.forEach((element) {
      if( element.typeTicket==filter) {
        listticket_clientfilter.add(element);
      }
    });}

    notifyListeners();
}
  void gettypeticket_filter(String filter){
    tickesearchlist=[];
    if(listticket.isNotEmpty){
      switch(filter){
        case '0':
          listticket.forEach((element) {
            if( element.typeTicket=='مغلقة') {
              tickesearchlist.add(element);
            }
          });
          break;

        case '1':
          listticket.forEach((element) {
            if( element.typeTicket=='قيد التنفيذ') {
              tickesearchlist.add(element);
            }
          });
          break;
        case '2':
          listticket.forEach((element) {
            if( element.typeTicket=='جديدة') {
              tickesearchlist.add(element);
            }
          });
          break;
      }

    }

    notifyListeners();
  }
//
Future<void> getticket() async {
  isloading=true;
  notifyListeners();
  var
  data=await Api()
      .get(url:url+ 'ticket/view_ticket.php?fk_country=${usercurrent!.fkCountry}');
   print('tickets print'); print(data);
  List<TicketModel> prodlist = [];
  for (int i = 0; i < data.length; i++) {

    prodlist.add(TicketModel.fromJson(data[i]));

  }
  listticket=prodlist;
  tickesearchlist=listticket;
  isloading=false;
  notifyListeners();

}


}