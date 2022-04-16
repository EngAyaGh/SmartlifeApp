import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/notificationModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class notifyvm extends ChangeNotifier {
  List<NotificationModel> listnotify=[];
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
    }
    listnotify=list;
    print(listnotify.length);
    notifyListeners();

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