


import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {

  bool sendcode=true;

  void changeboolValue(){
    sendcode=!sendcode;
    notifyListeners();
  }


}