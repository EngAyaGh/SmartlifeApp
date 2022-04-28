


import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class privilge_vm extends ChangeNotifier{

List<PrivilgeModel> privilgelist=[];

Future<void> getPrivilge(String level) async {
  List<dynamic> data =[];
  data=await Api()
      .get(url:url+
      'privilge/privGet.php?fk_level=$level');
  List<PrivilgeModel> list=[];
  for (int i = 0; i < data.length; i++) {
    list.add(PrivilgeModel.fromJson(data[i]));
    print(data[i]);
  }
  privilgelist=list;

  notifyListeners();

}


Future<bool> updatepriv_vm(
    String? fk_privileg,String is_check) async {
  bool res = await Api( ).post(
      url: url+'privilge/privUpdate.php?fk_privileg=$fk_privileg',
      body: {'is_check':is_check});
  if (res) {
    int index=privilgelist.indexWhere((element)
    => element.isCheck==is_check);
    // body.addAll({
    //
    // });
    //privilgelist[index]=PrivilgeModel.fromJson(body);
    //listProduct.insert(0, ProductModel.fromJson(body));
    notifyListeners();
  }
  return res;
}

}