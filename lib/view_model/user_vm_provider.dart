


import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/UserService.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class user_vm_provider extends ChangeNotifier{

  List<UserModel>? userall=[];
  late String? selecteduser=null;

  void changevalueuser(String s){
    selecteduser=s;
    notifyListeners();
  }

  UserModel? currentUser=
   UserModel(
       nameUser: "aya",fkCountry: "1",fkRegoin: "1",idUser: "1");

  Future<void> getclient_vm() async {
    userall = await  UserService().usersServices();
    notifyListeners();
  }
  bool getfilteruser(String filter){
    UserModel? user;
    userall!.map(
            (e) {
              e.nameUser!.contains(filter);return true;
            }
    );
    return false;
  }
  Future<bool> getcurrentuser() async {
    try {
      if(userall!.isEmpty)
      userall = await  UserService().usersServices();

      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? id = preferences.getString('id_user');
      print("in get user" + userall![0].nameUser.toString());

      final index = userall!.indexWhere((element) => element.idUser == "1");
      if(index>=0){
      currentUser = userall![index];
      return true;
      }
    }
    catch(e){
      print('exp error is '+e.toString());
      return false;
    }
    notifyListeners();
    return false;
  }

}