import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/notificationModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class notifyvm extends ChangeNotifier {
  List<NotificationModel> listnotify=[];
  int countnotify=0;

  void setcount(int val){
    countnotify=val;
    notifyListeners();
  }
  void addcounter(){
    countnotify++;
    notifyListeners();
  }
  void getcounter(){
    //
    print('get counter');
    listnotify.forEach((element) {
     if(element.isread=="0")
      countnotify++;
    });
    notifyListeners();
  }
  void clearcounter(){
    countnotify=0;
    notifyListeners();
  }
  UserModel? usercurrent;
  void setvalue(user){
    usercurrent=user;
    notifyListeners();
  }

  Future<void> getNotification() async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'notification/getnotifybyIdUser.php?to_user=${usercurrent!.idUser}');
    List<NotificationModel> list=[];
    for (int i = 0; i < data.length; i++) {
      list.add(NotificationModel.fromJson(data[i]));
      print(data[i]);
    }
    listnotify=list;
    print(listnotify.length);
    notifyListeners();

  }
  Future<String> setRead_notify_vm() async {
    print('in setRead_notify_vm ');
    bool b=false;
    listnotify.forEach((element) {
      if(element.isread=="0"){
        print("element foreach");
        print(element.isread);
        b=true;//set read
         }
    });
    String res="";
    if(b){
      print('inside if setRead_notify_vm ');

      res = await Api().post(
        body: {

    },url: url+'notification/set_read_notify.php?to_user=${usercurrent!.idUser}');
    if (res=="done") {
      listnotify.forEach((element) {
        if (element.isread == "0")
          element.isread = "1"; //set read
      });
      clearcounter();

    }
      // body.addAll({
      //   'isApprove':listClientbyCurrentUser[index].isApprove,
      //   'iduser_approve':listClientbyCurrentUser[index].iduser_approve,
      // });
     // listClientbyCurrentUser[index]=ClientModel.fromJson(body);
      //listProduct.insert(0, ProductModel.fromJson(body));
      notifyListeners();
    }
    return res;
  }
  Future<String> addNotification( Map<String,dynamic?> body) async {

      String result = await Api()
          .post( url:url+"notification/insertNotification.php",
          body: body);
      print(result);
      if (result!="error") {
        body.addAll({
          'id_notify': result,
        });
        //
        // listnotify.insert(0, NotificationModel.fromJson(body));
        // notifyListeners();
      }
        return result !="error"? result:"false";
  }

}