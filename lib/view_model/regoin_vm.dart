


import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/configmodel.dart';
import 'package:crm_smart/model/levelmodel.dart';
import 'package:crm_smart/model/regoin_model.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/RegoinServices.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class regoin_vm extends ChangeNotifier{

  late List<RegoinModel> listregoin=[];
  late String? selectedValueLevel=null;

  void changeVal(String?  val){
    selectedValueLevel=val;
    notifyListeners();
  }
  void clearvalues() {
    listregoin=[];
    selectedValueLevel=null;
    notifyListeners();
  }
  UserModel? usercurrent;

  void setvalue(user){
    usercurrent=user;
    notifyListeners();
  }
  Future<void> getregoin()async {

    //if(listregoin.isEmpty) {
      List<dynamic> data = [];
      data = await Api()
          .get(url: url +
          'country/get_regoinByIdCountry.php?fk_country=1');
      print(data);
      if (data != null) {
        for (int i = 0; i < data.length; i++) {
          listregoin.add(RegoinModel.fromJson(data[i]));
        }
      }
    }
    notifyListeners();
   //var  data=await RegoinService().getRegoinByCountry("1");
   //listregoin= data as  List<RegoinModel>;



  //}


}