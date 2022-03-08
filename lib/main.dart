import 'package:crm_smart/provider/authprovider.dart';
import 'package:crm_smart/provider/bottomNav.dart';
import 'package:crm_smart/provider/switch_provider.dart';
import 'package:crm_smart/ui/screen/client/clients.dart';
import 'package:crm_smart/ui/screen/login.dart';
import 'package:crm_smart/ui/screen/mainpage.dart';
import 'package:crm_smart/ui/screen/product/product.dart';
import 'package:crm_smart/ui/test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(
      MultiProvider(providers: [
    ChangeNotifierProvider<navigatorProvider>(create: (_) => navigatorProvider()),
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<switch_provider>(create: (_) => switch_provider()),

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
          } else {
            isUserLoggedIn =
                snapshot.data!.getBool(kKeepMeLoggedIn) ?? false;

            return
              MaterialApp(

                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    primaryColor: kMainColor,
                    backgroundColor: Colors.white,
                    brightness: Brightness.light,
                  ),
                  home: Directionality(textDirection: TextDirection.rtl,
                    child: isUserLoggedIn ? addProduct() : addProduct(),
                  ));
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
