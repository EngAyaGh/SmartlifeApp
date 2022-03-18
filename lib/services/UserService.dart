

import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/usermodel.dart';

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
  required int idUser,
  Map<String, dynamic>? body,
}) async {
  Map<String, dynamic> data = await Api().post(
    url: url+'users/updateuser_patch.php/$idUser',
    body: body,
    token: '',
  );
  return UserModel.fromJson(data);
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
  UserModel data = await Api().get(url: url+'users/getuserByID.php/$idUser');

  return data;
}

Future<UserModel> userByUserNAmeServices({required String userName}) async {
  UserModel data =
  await Api().get(url: url+'users/getuserByName.php/$userName');

  return data;
}

}