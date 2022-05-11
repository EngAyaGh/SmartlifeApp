



import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/ticketmodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class ticket_vm extends ChangeNotifier{

  List<TicketModel> listticket=[];

  Future<void> addticket(Map<String, dynamic?> body)async {
    listticket.add( await Api()
        .post( url:url+"ticket/add_ticket.php",body:
    body
    ));

    notifyListeners();
  }



}