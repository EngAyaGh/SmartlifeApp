



import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/ticketmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class ticket_vm extends ChangeNotifier{

  List<TicketModel> listticket=[];
  List<TicketModel> listticket_client=[];
  UserModel? usercurrent;

  void setvalue(user){
    usercurrent=user;
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
Future<void> getclient_ticket(String fkIdClient)async{
    listticket_client=[];
    //notifyListeners();
   if(listticket.isNotEmpty){
    listticket.forEach((element) {
    if( element.fkClient==fkIdClient);
    listticket_client.add(element);
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
  notifyListeners();

}


}