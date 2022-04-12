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

    for (int i = 0; i < data.length; i++) {
      listnotify.add(NotificationModel.fromJson(data[i]));
    }
    print(listnotify.length);
    notifyListeners();

  }



}