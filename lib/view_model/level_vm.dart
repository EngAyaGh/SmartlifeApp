import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/configmodel.dart';
import 'package:crm_smart/model/levelmodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class level_vm extends ChangeNotifier{

  late List<LevelModel> listoflevel=[];
  late String? selectedValueLevel=null;

  void changeVal(String?  val){
    selectedValueLevel=val;
    notifyListeners();
  }
  Future<void> getlevel()async {
    //listoflevel=[];
    List<dynamic> data=[];
    data= await Api()
        .get(url:url+ 'config/getLevel.php');
       if(data !=null) {
       for (int i = 0; i < data.length; i++) {
       listoflevel.add(LevelModel.fromJson(data[i]));
       }}
       notifyListeners();
       //return data;
  }


}