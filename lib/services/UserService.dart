

import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'dart:io';
import '../constants.dart';

class UserService{

Future<String> addUser(body) async {
  String data = await Api().post(
    url:url+'users/addUser.php',
    body:body,
    //token: '',
  );
  return data;//UserModel.fromJson(data);
}
Future<UserModel> UpdateUser({
  required String? idUser,
  required Map<String, dynamic> body,
  File? file
}) async {

var data = await Api().postRequestWithFile(
   url+'users/updateuser_patch.php?id_user=$idUser',
   body,
   file!,
  );
  List<UserModel> usersList = [];

  for (int i = 0; i < data.length; i++) {
  usersList.add(UserModel.fromJson(data[i]));
  }
  return usersList[0];

}



Future<List<UserModel>> usersServices() async {
  List<dynamic> data = await Api().get(url: url+'users/getUser.php');

  List<UserModel> usersList = [];

  for (int i = 0; i < data.length; i++) {
    usersList.add(UserModel.fromJson(data[i]));
  }
  return usersList;
}

Future<UserModel> userByIdServices({required int idUser}) async {
  UserModel data = await Api().get(url: url+'users/getuserByID.php?id_user=$idUser');

  return data;
}

Future<UserModel> userByUserNAmeServices({required String userName}) async {
  UserModel data =
  await Api().get(url: url+'users/getuserByName.php?txtsearch=$userName');

  return data;
}

}