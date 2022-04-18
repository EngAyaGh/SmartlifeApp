


import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/UserService.dart';
import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class user_vm_provider extends ChangeNotifier{

  List<UserModel>? userall=[];
  var isLoading = true;
  late String? selecteduser=null;

  void changevalueuser(String s){
    selecteduser=s;
    notifyListeners();
  }

  UserModel? currentUser=
   UserModel(
       nameUser: "aya",fkCountry: "1",
       fkRegoin: "1",idUser: "1",email: "aya.ghoury@gmail.com");

  Future<void> getuser_vm() async {
    isLoading=true;
    userall = await  UserService().usersServices();
    isLoading=false;
    notifyListeners();
  }
  Future<String> updateuser_vm(Map<String, dynamic?> body,String? iduser) async {

    String result=await UserService()
        .UpdateUser(body: body,idUser: iduser);
   if(result!="error"){
    final index = userall!.indexWhere(
            (element) =>
    element.idUser ==iduser );
    body.addAll({
      'nameUser': userall![index].nameUser,
      'id_user': userall![index].idUser.toString(),
      'code_verfiy': userall![index].codeVerfiy.toString(),
      'fk_country': userall![index].fkCountry.toString(),
      //'code_verfiy': controllerUsers.usersList[index].codeVerfiy.toString(),
      'nameCountry':userall![index].nameCountry.toString(),
      'name_regoin': userall![index].nameRegoin.toString(),
      'name_level': userall![index].name_level.toString(),
    });
    print(body);
    print('///////////');
    userall![index] = UserModel.fromJson(body);
   }
    notifyListeners();
    return result;
  }
    Future<String> adduser_vm(Map<String, dynamic?> body) async {
    String res = await UserService().addUser(body);
    if (res!="false") {
      body.addAll({
        '	id_user':res,
      });

      userall!.insert(0, UserModel.fromJson(body));
      notifyListeners();
    }
    return res;
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
      notifyListeners();
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