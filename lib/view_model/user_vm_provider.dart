


import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/UserService.dart';
import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
class user_vm_provider extends ChangeNotifier{

  List<UserModel> userall=[];
  List<UserModel> listuserfilter=[];
  var isLoading = true;
  bool isupdate=false;
  late UserModel? selecteduser=null;

  void changevalueuser(UserModel? s){
    selecteduser=s;
    notifyListeners();
  }

  UserModel? currentUser;
  //List<PrivilgeModel> privilgelist=[];

  // UserModel(
   //     nameUser: "aya",fkCountry: "1",
   //     fkRegoin: "1",idUser: "1",email: "aya.ghoury@gmail.com");

  Future<void> getuser_vm() async {
    isLoading=true;
    userall = await  UserService().usersServices();
    isLoading=false;
    listuserfilter=userall;
    notifyListeners();
  }
  Future<void> updateuser_vm(Map<String, String?> body,String? iduser,File? file) async {
    isupdate=true;
    notifyListeners();
    final index = userall.indexWhere(
            (element) =>
        element.idUser ==iduser );
    userall[index] =await UserService()
        .UpdateUser(body: body,idUser: iduser,file: file);
    getcurrentuser();
    //if(result!="error"){

    // body.addAll({
    //
    //   'nameUser': userall[index].nameUser,
    //   'id_user': userall[index].idUser.toString(),
    //   'code_verfiy': userall[index].codeVerfiy.toString(),
    //   'fk_country': userall[index].fkCountry.toString(),
    //   //'code_verfiy': controllerUsers.usersList[index].codeVerfiy.toString(),
    //   'nameCountry':userall[index].nameCountry.toString(),
    //   'currency':userall[index].currency,
    //    //'name_regoin': userall![index].nameRegoin.toString(),
    //   // 'name_level': userall![index].name_level.toString(),
    // });
    // print(body);
    print('///////////');
    //userall[index] = UserModel.fromJson(body);

    userall[index].path="";
    isupdate=false;
    notifyListeners();
   // return result;
  }
    Future<String> adduser_vm(Map<String, String?> body) async {
    String res = await UserService().addUser(body);
    if (res!="false") {
      body.addAll({
        'id_user':res,
        'img_image':'',
        'img_thumbnail':''
      });

      userall.insert(0, UserModel.fromJson(body));
      notifyListeners();
    }
    return res;
  }
  Future<void> searchProducts(
      String productName) async {
    listuserfilter=[];
    // code to convert the first character to uppercase
    String searchKey =productName;//
    if(productName.isNotEmpty)
    if(userall.isNotEmpty ){
      userall.forEach((element) {
        if(element.nameUser!.contains(searchKey,0)

            || element.mobile!.contains(searchKey,0) )
          listuserfilter.add(element);
      });
    }
    else listuserfilter=userall;
    notifyListeners();
  }

  bool getfilteruser(String filter){
    UserModel? user;
    userall.map(
            (e) {
              e.nameUser!.contains(filter);return true;
            }
    );
    return false;
  }
  Future<bool> tryAutoLogin()async{
    final prefs=await SharedPreferences.getInstance();
    if(!prefs.containsKey('id_user')){
      return false;
    }
    final extractedUserData=prefs.getString('id_user');
    notifyListeners();
    return true;
  }
  Future<SharedPreferences> getcurrentuser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      if(userall.isEmpty)
      userall = await  UserService().usersServices();
      String? id = preferences.getString('id_user');
      //print("in get user" + userall[0].nameUser.toString());

      final index = userall.indexWhere((element) => element.idUser == id);
      if(index>=0){
      currentUser = userall[index];
      currentUser!.path="";
      notifyListeners();
      print("preferences");
      print(preferences.containsKey('id_user'));
      return preferences;
      }
    }
    catch(e){
      print('exp error is '+e.toString());

    }
    notifyListeners();
    return preferences;
  }

}