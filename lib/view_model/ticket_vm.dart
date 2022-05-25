



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
    notifyListeners();
  }
  Future<void> searchProducts(
      String productName) async {
    List<TicketModel> ticketlistsearch=[];
    // code to convert the first character to uppercase
    String searchKey =productName;//

    print('search');
    print(searchKey);
    if(listticket.isNotEmpty ){
      listticket.forEach((element) {
        if(element.nameEnterprise.contains(searchKey,0)
            || element.nameClient.contains(searchKey,0)
            || element.mobile!.contains(searchKey,0) )
          ticketlistsearch.add(element);
      });
    }

    tickesearchlist=ticketlistsearch;
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
      notifyListeners();

  }
void getclient_ticket(String fkIdClient){
    listticket_client=[];
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

void getclientticket_filter(String filter){
  listticket_clientfilter=[];
  if(listticket.isNotEmpty){
    listticket.forEach((element) {
      if( element.typeTicket==filter) {
        listticket_clientfilter.add(element);
      }
    });}

    notifyListeners();
}

Future<void> getticket() async {
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
  notifyListeners();

}


}