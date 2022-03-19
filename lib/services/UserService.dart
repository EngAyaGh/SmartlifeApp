

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
Future<String> UpdateUser({
  required String? idUser,
  Map<String, dynamic>? body,
}) async {
 String result = await Api().post(
    url: url+'users/updateuser_patch.php?id_user=$idUser',
    body: body,
    //token: '',
  );
 return result;
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