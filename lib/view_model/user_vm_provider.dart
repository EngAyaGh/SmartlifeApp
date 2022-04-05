


import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/UserService.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class user_vm_provider extends ChangeNotifier{

  List<UserModel>? userall=[];
   UserModel? currentUser=
   UserModel(
       nameUser: "aya",fkCountry: "1",fkRegoin: "1",idUser: "1");

  Future<void> getclient_vm() async {
    userall = await  UserService().usersServices();
    notifyListeners();
  }
  Future<bool> getcurrentuser() async {
    try {
      if(userall!.isEmpty)
      userall = await  UserService().usersServices();

      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? id = preferences.getString('id_user');
      print("in get user" + userall![0].nameUser.toString());

      final index = userall!.indexWhere((element) => element.idUser == "1");

      currentUser = userall![index];
    }
    catch(e){print('exp error is '+e.toString());}
    notifyListeners();
    return true;
  }

}