



import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class communication_vm extends ChangeNotifier{

  List<CommunicationModel> listCommunication=[];
  List<CommunicationModel> listCommunicationInstall=[];
  List<CommunicationModel> listCommunicationWelcome=[];
  List<CommunicationModel> listCommunicationClient=[];
  UserModel? usercurrent;

  void setvalue(user){
    usercurrent=user;
    notifyListeners();
  }
  void getCommunicationclient(String fk_client) {

    listCommunicationClient=[];
    if(listCommunication.isNotEmpty){
      listCommunication.forEach((element) {
        if(element.fkClient==fk_client)
          listCommunicationClient.add(element);
      });
    }
      notifyListeners();
  }
  void getCommunicationInstall() {

    listCommunicationInstall=[];
    if(listCommunication.isNotEmpty){
      listCommunication.forEach((element) {
        if(element.typeCommuncation=='تركيب'&&element.fkUser==null)
          listCommunicationInstall.add(element);
      });
    }
    notifyListeners();
  }
  void getCommunicationWelcome() {

    listCommunicationWelcome=[];
    if(listCommunication.isNotEmpty){
      listCommunication.forEach((element) {
        if(element.typeCommuncation=='ترحيب'&&element.fkUser==null)
          listCommunicationWelcome.add(element);
      });
    }
    notifyListeners();
  }
  Future<void> getCommunicationall()async {
    listCommunication=[];
    // if(listComments.isEmpty){
    List<dynamic> data=[];
    //viewcommunicationAll.php
    data= await Api()
        .get(url:url+ 'care/viewcommunicationAll.php?fkcountry=${usercurrent!.fkCountry}');
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