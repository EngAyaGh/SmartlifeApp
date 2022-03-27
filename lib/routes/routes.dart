import 'package:crm_smart/binding/binding.dart';
import 'package:crm_smart/ui/screen/client/clients.dart';
import 'package:crm_smart/ui/screen/login.dart';
import 'package:crm_smart/ui/screen/mainpage.dart';
import 'package:crm_smart/ui/screen/product/productView.dart';
import 'package:crm_smart/ui/screen/selectCountryScreen.dart';
import 'package:crm_smart/ui/screen/user/alluser.dart';
import 'package:get/get.dart';

class AppRoutes {
  //static const mainpage = Routes.mainpage;

  static final routes = [
    GetPage(
      name: Routes.mainpage,
      page: () => const main_page(),
      bindings: [
        UserBinding(),
      ],
    ),
    GetPage(name: Routes.login, page: () => login()),
    GetPage(name: Routes.allClientUser, page: () => client_dashboard()),
    GetPage(name: Routes.productview, page: () => ProductView()),
    GetPage(name: Routes.select_country, page: () => select_country()),
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
  static const allClientUser = '/client_dashboard';
  static const userScreen = '/userScreen';
  static const mainpage = '/main_page';
  static const productview = '/ProductView';
  static const login = '/login';
  static const select_country = '/select_country';
}
