
import 'package:crm_smart/api/fcm.dart';
import 'package:crm_smart/provider/authprovider.dart';
import 'package:crm_smart/provider/bottomNav.dart';
import 'package:crm_smart/provider/config_vm.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/provider/switch_provider.dart';
import 'package:crm_smart/routes/routes.dart';
import 'package:crm_smart/ui/screen/client/clients.dart';
import 'package:crm_smart/ui/screen/client/tabclients.dart';
import 'package:crm_smart/ui/screen/home/home.dart';
import 'package:crm_smart/ui/screen/login.dart';
import 'package:crm_smart/ui/screen/mainpage.dart';
import 'package:crm_smart/ui/screen/product/addproduct.dart';
import 'package:crm_smart/ui/screen/product/productView.dart';
import 'package:crm_smart/ui/screen/selectCountryScreen.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:crm_smart/ui/screen/user/alluser.dart';

import 'package:crm_smart/ui/widgets/combox_widget/levelcombox.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crm_smart/api/firebase_option.dart';
import 'binding/binding.dart';
import 'constants.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  //DefaultFirebaseOptions .currentPlatform );

  print("Handling a background message: ${message.messageId}");
  print("Handling a background message: ${message.data['iduser']}");
  print("Handling a background message: ${message.data['nameuser']}");
}

void main() async {
  // <meta-data
  // android:name="com.google.firebase.messaging.defult_notification_channel_id"
  // android:value="high_importance_channel"
  // />
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options:FirebaseOptions(
  //   apiKey: 'AIzaSyDQVScJ2gMSCwAWh1zTnjtzOk2SGWSjStI',
  //   appId: '1:102540138446:web:a8933eabd8a1d0cee5fd9f',
  //   messagingSenderId: '102540138446',
  //   projectId: 'crmapp-8f9de',
  //   authDomain: 'crmapp-8f9de.firebaseapp.com',
  //   //databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
  //   storageBucket: 'crmapp-8f9de.appspot.com',
  //   measurementId: 'G-KJC7EKRNM6',
  // ));
  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

 // FCM().getmessge();
  //Provider.debugCheckInvalidValueType = null;

  // void main() async {
  //   //WidgetsFlutterBinding.ensureInitialized(); // uncomment if needed for resource initialization
  //   GlobalBindings().dependencies();
  //   runApp(MyApp());
  // }
  //await Firebase.initializeApp();
  runApp(

      MultiProvider(providers: [
        ChangeNotifierProvider<user_vm_provider>(create: (_) => user_vm_provider()),

        ChangeNotifierProvider<navigatorProvider>(create: (_) => navigatorProvider()),
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<switch_provider>(create: (_) => switch_provider()),
        ChangeNotifierProvider<selected_button_provider>(create: (_) => selected_button_provider()),
        ChangeNotifierProvider<country_vm>(create: (_) => country_vm()),
        ChangeNotifierProvider<config_vm>(create: (_) => config_vm()),
         ChangeNotifierProvider<level_vm>(create: (_) => level_vm()),
        ChangeNotifierProvider<regoin_vm>(create: (_) => regoin_vm()),
        ChangeNotifierProvider<LoadProvider>(create: (_) => LoadProvider()),
        ChangeNotifierProvider<product_vm>(create: (_) => product_vm()),
        ChangeNotifierProvider<manage_provider>(create: (_) => manage_provider()),
        //ChangeNotifierProvider<client_vm>(create: (_) => client_vm()),
        ChangeNotifierProxyProvider<user_vm_provider,client_vm>(
             create: (_)=> client_vm(),
              //   Provider.of<user_vm_provider>(_, listen: false).currentUser),
            update: (ctx,value,prev)=>prev!..setvalue(value.currentUser),
              //  client_vm(value.currentUser)
        ),
        ChangeNotifierProvider<invoice_vm>(create: (_) => invoice_vm()),
        ChangeNotifierProvider<typeclient>(create: (_)=> typeclient()),

  ], child:MyApp()));
}

class MyApp extends StatelessWidget {
  bool isUserLoggedIn = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            //Center(child: CircularProgressIndicator(),)
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('Loading....'),
                ),
              ),
            );
          }
          else {
            isUserLoggedIn =
                snapshot.data!.getBool(kKeepMeLoggedIn) ?? false;

            return
              GetMaterialApp(
                //initialBinding: UserBinding(),
                initialRoute: Routes.Home,
                getPages: AppRoutes.routes,
                home:Home(),
                //main_page(),

                // Directionality(
                //   textDirection: TextDirection.rtl,
                //   child: isUserLoggedIn ? client_dashboard():client_dashboard(),
                // ),

                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    primaryColor: kMainColor,
                    backgroundColor: Colors.white,
                    brightness: Brightness.light,
                  ),
                  // home: Directionality(
                  //   textDirection: TextDirection.rtl,
                  //   child: isUserLoggedIn ? main_page() : main_page(),
                  // )
              );
          }
        });
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return login();
 // This trailing comma makes auto-formatting nicer for build methods.

  }
}
