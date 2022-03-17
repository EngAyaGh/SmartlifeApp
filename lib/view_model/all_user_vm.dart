
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/UserService.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

class AllUserVMController extends GetxController {
  var usersList = <UserModel>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    getUsers();
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