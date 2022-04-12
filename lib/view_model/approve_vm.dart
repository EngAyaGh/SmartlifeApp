
import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/approvemodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class approve_vm extends ChangeNotifier {
  List<ApproveModel> listapprove=[];
  UserModel? usercurrent;

  void setvalue(user){
    usercurrent=user;
    notifyListeners();
  }
  Future<void> getApprovebyregoin() async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'client/approveClientGet.php?fk_regoin=${usercurrent!.fkRegoin}');

    for (int i = 0; i < data.length; i++) {
      listapprove.add(ApproveModel.fromJson(data[i]));
    }
    print(listapprove);
    notifyListeners();
  }

  Future<void> getApprovebycountry() async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'client/approveClientGet.php?fk_country=${usercurrent!.fkCountry}');

    for (int i = 0; i < data.length; i++) {
      listapprove.add(ApproveModel.fromJson(data[i]));
    }
    print(listapprove);
notifyListeners();
  }

}