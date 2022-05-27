



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
  List<CommunicationModel> listinstallnumber=[];
  List<CommunicationModel> listwelcomenumber=[];
  UserModel? usercurrent;

  void setvalue(user){
    usercurrent=user;
    notifyListeners();
  }
  int selectedtypeinstall=0;

  void changeinstall(int s){
    selectedtypeinstall=s;
    notifyListeners();
  }
  void getCommunicationclient(String fk_client) {
    listCommunicationClient=[];
    if(listCommunication.isNotEmpty){
      listCommunication.forEach((element) {
        if(element.fkClient==fk_client&&element.fkUser!=null)
          listCommunicationClient.add(element);
      });
    }
      notifyListeners();
  } 
  void getCommunicationInstallednumber() {

    listinstallnumber=[];
    if(listCommunicationInstall.isNotEmpty){
    listCommunicationInstall.forEach((element) {
    if(element.fkUser==null)
      listinstallnumber.add(element) ;
    });
    }
      //notifyListeners();
  }
  void getCommunicationwelcomenumber() {

    listwelcomenumber=[];
    if(listCommunicationWelcome.isNotEmpty){
      listCommunicationWelcome.forEach((element) {
    if(element.fkUser==null)
      listwelcomenumber.add(element) ;
    });
    }
     // notifyListeners();
  }
  void getCommunicationInstall() {

    listCommunicationInstall=[];
    if(listCommunication.isNotEmpty){
      listCommunication.forEach((element) {
        if(element.typeCommuncation=='تركيب')//&&element.fkUser==null)
          listCommunicationInstall.add(element);
      });
    }
    getCommunicationInstallednumber();
    notifyListeners();
  }
  void getCommunicationWelcome() {

    listCommunicationWelcome=[];
    if(listCommunication.isNotEmpty){
      listCommunication.forEach((element) {
        if(element.typeCommuncation=='ترحيب')//&&element.fkUser==null)
          listCommunicationWelcome.add(element);
      });
    }
    getCommunicationwelcomenumber();
    notifyListeners();
  }
  //addcommuncation
  Future<CommunicationModel> addcommuncation(Map<String, dynamic?> body,String id_communication) async {
    print(id_communication);
  var result=  await Api()
        .post(url:url+ 'care/updateCommunication.php?id_communication=$id_communication',
  body: body
  );
  CommunicationModel data = CommunicationModel.fromJson(result[0]);
    int index= listCommunication.indexWhere((element) =>
    element.idCommunication==id_communication);

    listCommunication[index]=data;
    getCommunicationInstall();
    //notifyListeners();
    return data;
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