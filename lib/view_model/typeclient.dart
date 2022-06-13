

import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/reasonmodel.dart';
import 'package:crm_smart/services/configService.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class typeclient extends ChangeNotifier{
  List<String> type_of_client=[];
  List<String> type_of_welcome=['الكل','تم الترحيب','لم يتم الترحيب'];
  List<String> type_of_install_iso=['الكل','تم التأكد من جودة التركيب',
    'لم يتم التأكد من جودة التركيب'];
  List<String> type_of_client_filter=['الكل','مشترك','تفاوض','عرض سعر','مستبعد','منسحب'];
 // List<String> type_of_client=['تفاوض','عرض سعر','مستبعد','منسحب'];
  List<ReasonModel> type_of_out=[]; //أسباب الانسحاب
  List<String> listtype_install=['الكل','بالإنتظار','تم التركيب'];
  late String? selectedValuemanag=null;

  void changevalue(String? s){
    selectedValuemanag=s;
    notifyListeners();
  }
  late String? selectedValufilter=null;

  void changevaluefilter(String? s){
    selectedValufilter=s;
    notifyListeners();
  }//listtype_install
  late String? selectedlisttype_install=null;

  void changelisttype_install(String? s){
    selectedlisttype_install=s;
    notifyListeners();
  }
  late String? selectedwelcome=null;

  void changelisttype_welcome(String? s){
    selectedwelcome=s;
    notifyListeners();
  }
  late String? selectedinstall_iso=null;

  void changelisttype_install_iso(String? s){
    selectedinstall_iso=s;
    notifyListeners();
  }
  ///////////////////////////////////////////////
   int selectedinstall=0;

  void changeinstall(int s){
    selectedinstall=s;
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
  Future<String> addReson_vm(Map<String, dynamic?> body) async {

    String res = await Api().post(
        url: url+'config/addreson.php',//users/addmangemt.php
        body: body);
    if (res!="error") {
      body.addAll({
        'id_reason':res,
      });
      type_of_out.insert(0,ReasonModel.fromJson(body));
      notifyListeners();
    }
    return res;
  }
}