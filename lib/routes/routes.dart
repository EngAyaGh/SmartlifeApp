import 'package:crm_smart/binding/binding.dart';
import 'package:crm_smart/ui/screen/calendar/calendar.dart';
import 'package:crm_smart/ui/screen/client/clients.dart';
import 'package:crm_smart/ui/screen/home/home.dart';
import 'package:crm_smart/ui/screen/login.dart';
import 'package:crm_smart/ui/screen/mainpage.dart';
import 'package:crm_smart/ui/screen/product/addproduct.dart';
import 'package:crm_smart/ui/screen/product/productView.dart';
import 'package:crm_smart/ui/screen/schedulingClient/scheduling_client.dart';
import 'package:crm_smart/ui/screen/selectCountryScreen.dart';
import 'package:crm_smart/ui/screen/user/adduser.dart';
import 'package:crm_smart/ui/screen/user/alluser.dart';
import 'package:crm_smart/ui/screen/user/edituser.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const homePage = Routes.schedulingClient;
  //static const mainPage = Routes.calendar;

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
    GetPage(name: Routes.productadd, page: () => addProduct()),
    GetPage(name: Routes.select_country, page: () => select_country()),
    GetPage(
      name: Routes.home,
      page: () => Home(),
    ),
    GetPage(
      name: Routes.calendar,
      page: () => Calendar(),
    ),
    GetPage(
      name: Routes.calendar,
      page: () => Calendar(),
    ),
    GetPage(
      name: Routes.schedulingClient,
      page: () => SchedulingClient(),
      bindings: [
        UserBinding(),
      ],
    ),
    // GetPage(name: Routes.editUser, page: () => EditUser(index: 0)),
    // GetPage(name: Routes.addUser, page: () => addUser()),
  ];
}

class Routes {
  static const allUserScreen = '/allUserScreen';
  // static const editUser = '/editUser';
  // static const addUser = '/addUser';
  static const allClientUser = '/client_dashboard';
  static const userScreen = '/userScreen';
  static const mainpage = '/main_page';
  static const productview = '/ProductView';
  static const productadd = '/productadd';

  static const login = '/login';
  static const select_country = '/select_country';
  static const home = '/home';
  static const calendar = '/calendar';
  static const schedulingClient = '/schedulingClient';
}
