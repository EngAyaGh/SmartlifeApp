



import 'package:crm_smart/binding/binding.dart';
import 'package:crm_smart/ui/screen/user/alluser.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const allUser = Routes.allUserScreen;

  static final routes = [
    GetPage(
      name: Routes.allUserScreen,
      page: () => AllUserScreen(),
      bindings: [
        UserBinding(),
      ],
    ),
  ];
}

class Routes {
  static const allUserScreen = '/allUserScreen';
  static const userScreen = '/userScreen';
}