



import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/communication_modle.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class communication_vm extends ChangeNotifier{

  List<CommunicationModel> listCommunication=[];

  Future<void> getCommunication(String fk_client)async {
    listCommunication=[];
    // if(listComments.isEmpty){
    List<dynamic> data=[];
    data= await Api().get(url:url+ 'care/view_communcation.php?fk_client=$fk_client');
    print(data);
    if(data.length.toString().isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        listCommunication.add(CommunicationModel.fromJson(data[i]));
      }
      //}
      notifyListeners();
      //return data;
    }
  }

}