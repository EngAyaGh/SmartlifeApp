
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/UserService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllUserVMController extends GetxController {
  var usersList = <UserModel>[].obs;
  var isLoading = true.obs;
  var currentUser=UserModel().obs;

  @override
  void onInit() {
    super.onInit();
    getUsers();

    //print(currentUser.value.nameUser);
  }
  @override
  void onReady(){
    //getUsers();
    //getcurrentUser();
  }
  Future<void> getcurrentUser() async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? id =preferences.getString('id_user');
    print(usersList[0].nameUser);
    final index=usersList.indexWhere((element) => element.idUser=="1");

    currentUser.value=  usersList[index].obs.value;

  }
  void getUsers() async {
    var users = await UserService().usersServices();
    try {
      isLoading(true);
      if (users.isNotEmpty) {
        usersList.addAll(users);
      }
    } finally {
      isLoading(false);
    }
  }
}