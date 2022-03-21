
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/UserService.dart';
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

  }

  Future<void> getcurrentUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? id =preferences.getString('id_user');
    final index=usersList.indexWhere((element) => element.idUser=="1");
    currentUser.value=  usersList[index];
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