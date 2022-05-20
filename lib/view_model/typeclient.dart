

import 'package:crm_smart/model/reasonmodel.dart';
import 'package:crm_smart/services/configService.dart';
import 'package:flutter/cupertino.dart';

class typeclient extends ChangeNotifier{
  List<String> type_of_client=[];
  List<String> type_of_client_filter=['الكل','مشترك','تفاوض','عرض سعر','مستبعد','منسحب'];
 // List<String> type_of_client=['تفاوض','عرض سعر','مستبعد','منسحب'];
  List<ReasonModel> type_of_out=[]; //أسباب الانسحاب

  late String? selectedValuemanag=null;

  void changevalue(String? s){
    selectedValuemanag=s;
    notifyListeners();
  }
  late String? selectedValufilter=null;

  void changevaluefilter(String? s){
    selectedValufilter=s;
    notifyListeners();
  }
  late String? selectedValueOut=null;

  void changevalueOut(String s){
    selectedValueOut=s;
    notifyListeners();
  }
  //
 Future<void> getreasons(String type) async {
  selectedValueOut=null;
   notifyListeners();
  if(type_of_out.isEmpty)
     type_of_out = await config_service().getreason(type);
  notifyListeners();
 }
}