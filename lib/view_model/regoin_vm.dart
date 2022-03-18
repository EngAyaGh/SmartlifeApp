


import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/configmodel.dart';
import 'package:crm_smart/model/levelmodel.dart';
import 'package:crm_smart/model/regoin_model.dart';
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
  Future<void> getregoin(String? fk_country)async {

    List<dynamic> data=[];
    data= await Api()
        .get(url:url+ 'country/get_regoinByIdCountry.php?fk_country=$fk_country');
    if(data !=null) {
      for (int i = 0; i < data.length; i++) {
        listregoin.add(RegoinModel.fromJSON(data[i]));
      }
    }
    notifyListeners();
   //var  data=await RegoinService().getRegoinByCountry("1");
   //listregoin= data as  List<RegoinModel>;



  }


}